# SPDX-License-Identifier: Apache-2.0
# Licensed to the Ed-Fi Alliance under one or more agreements.
# The Ed-Fi Alliance licenses this file to you under the Apache License, Version 2.0.
# See the LICENSE and NOTICES files in the project root for more information.

#
# Determine extension for a particular SmoObject
#
function GetTypeExt([Microsoft.SqlServer.Management.Smo.SqlSmoObject] $Item) 
{
    $ext = "Other"
    if($Item -is [Microsoft.SqlServer.Management.Smo.Table])
    {
        $ext = "Table"
    } 
    if($Item -is [Microsoft.SqlServer.Management.Smo.View])
    {
        $ext = "View"
    }
    if($Item -is [Microsoft.SqlServer.Management.Smo.StoredProcedure])
    {
        $ext = "StoredProcedure"
    }
    if($Item -is [Microsoft.SqlServer.Management.Smo.UserDefinedFunction])
    {
        $ext = "UserDefinedFunction"
    }
    if($Item -is [Microsoft.SqlServer.Management.Smo.UserDefinedDataType])
    {
        $ext = "UserDefinedDataType"
    }
    return $ext
}

#
# Function to exclude certain items from the dependencies
#
function ScriptingFilter([Microsoft.SqlServer.Management.Sdk.Sfc.Urn]$urn) {
    $item = $srv.GetSmoObject($urn)
    $type = GetTypeExt($item)
    if(-not $Filter -eq "" -and $type.StartsWith($Filter))
    {
        Write-Host "  Filter: " $item " => " $type
        return $true
    } else {
        return $false
    }
}

#
# Generate Scripts without dependencies for Objects in $Objects
#
function GenScripts([string]$typeName) 
{
    $urns = New-Object Microsoft.SqlServer.Management.Smo.UrnCollection;
    foreach($dep in $Objects) { 
		$urns.add($dep.Urn) 
	}
	if($urns.Count -eq 0) {
		GenScriptForObjectsWithoutUrn $typeName
	} else {
		GenScriptsForObjects $urns $typeName
	}
}

#
#	Some objects don't have Urn values
#
function GenScriptForObjectsWithoutUrn([string]$typeName){
        $i = 0
        $max = $urnCollection.Count
        $global:count++
        $scripter.Options.FileName = $scriptPath + $count.ToString("0000") + '-' + $typeName + ".SQL" 

		foreach ($item in $Objects) {
		if(!$item.IsSystemObject){
            Write-Progress -Activity "Script $dbName $typeName..." -status $item.Name -percentComplete ($i / $max * 100)
			$item.Script($scrOpts) + "GO`r" | out-File $filename -Append
		}
	}
}


#
# Generate Scripts with dependencies for Objects in $Objects
#
function GenScriptsWithDependencies([string] $typeName)
{
    $scripter.FilterCallbackFunction = get-content Function:\ScriptingFilter
    if($Objects.Length -ne 0)
    {
        $dependencyTree = $scripter.DiscoverDependencies($Objects, $true)
        $depCollection = $scripter.WalkDependencies($dependencyTree);
        $urns = New-Object Microsoft.SqlServer.Management.Smo.UrnCollection;
        foreach($dep in $depCollection) { 
			$urns.add($dep.Urn) 
		}
	if($urns.Count -eq 0) {
		GenScriptForObjectsWithoutUrn $typeName
	} else {
		GenScriptsForObjects $urns $typeName
	}    }
}

#
# Generate Scripts for a Collection of SmoObjects
#
function GenScriptsForObjects([Microsoft.SqlServer.Management.Smo.UrnCollection]$urnCollection, [string]$typeName)
{
        $onlyOne = New-Object Microsoft.SqlServer.Management.Smo.UrnCollection;
        $i = 0
        $max = $urnCollection.Count

        $global:count++
        $scripter.Options.FileName = $scriptPath + $count.ToString("0000") + '-' + $typeName + ".SQL" 

        foreach($urn in $urnCollection)
        {
            $onlyOne.clear()
            $item = $srv.GetSmoObject($urn)
            
            Write-Progress -Activity "Script $dbName $typeName..." -status $item.Name -percentComplete ($i / $max * 100)
            
            $ext = GetTypeExt($item)
            
            if($item.Name.StartsWith("spt_") -or $item.IsSystemObject -eq $true)
            {
                Write-Host "  Ignored: " $item.Name
            } else {
                if(-not $UrnsDone.Contains($item.Urn))
                {
                    $onlyOne.add($item.Urn)
                    $scripter.Script($onlyOne)
                    $UrnsDone.add($item.Urn)
                    $i = $i + 1
                }
            }
        }
}

#
# Main Function: Provides connection to SQLServer, determines the items and scripted this
#
function GenerateDBScript([string]$dbName)
{
	[string]$dbServer = "."
	[string]$scriptPath = (Get-Item -Path ".\" -Verbose).FullName + "\Structure\$dbname.Database\"

	# Write-Host "directory: $scriptPath"
	New-Item -ItemType Directory -Force -Path "$scriptPath" > $null
	Remove-Item "$scriptPath\0*-*.SQL" | WHERE {! $_.PSIsContainer }

    "Generate scripts for server: " + $dbServer + " database: " + $dbName + "  to Path: " + $scriptPath

    [System.Reflection.Assembly]::LoadWithPartialName("Microsoft.SqlServer.SMO") | out-null
    [System.Reflection.Assembly]::LoadWithPartialName("System.Data") | out-null

    $srv = new-object "Microsoft.SqlServer.Management.SMO.Server" $dbServer
    $srv.SetDefaultInitFields([Microsoft.SqlServer.Management.SMO.View], "IsSystemObject")

    $db = New-Object "Microsoft.SqlServer.Management.SMO.Database"
    $db = $srv.Databases[$dbName]

    $scripter = New-Object "Microsoft.SqlServer.Management.Smo.Scripter"
    $scripter.Server = $srv

    $scrOpts = New-Object "Microsoft.SqlServer.Management.SMO.ScriptingOptions"
    #$scrOpts.Encoding = [System.Text.Encoding]::GetEncoding(1252)
    $scrOpts.AllowSystemObjects = $false
    $scrOpts.AnsiFile = $true
    $scrOpts.AppendToFile = $true #$false
    $scrOpts.ClusteredIndexes = $true
    $scrOpts.Default = $true
    $scrOpts.DriAll = $true
	$scrOpts.ExtendedProperties = $true
    $scrOpts.Indexes = $true
	$scrOpts.IncludeIfNotExists = $True
    $scrOpts.NonClusteredIndexes = $true
    $scrOpts.ToFileOnly = $true
    $scrOpts.WithDependencies = $false
    $scrOpts.Triggers = $true
    $scripter.Options = $scrOpts

    $UrnsDone = New-Object Microsoft.SqlServer.Management.Smo.UrnCollection;
    $Filter = ""
    $global:count = 0

    try {

        $Objects = @()            
        Write-Progress -Activity "Script $dbName..." -status "Schemas" -percentComplete 0
        $Res = $db.Schemas | where {$_.IsSystemObject -eq $false}
        if($Res){$Objects += $Res}
		$Filter = ""
		GenScripts "Schemas"

		        $Objects = @()            
        Write-Progress -Activity "Script $dbName..." -status "Roles" -percentComplete 0
        $Res = $db.Roles #| where {$_.IsSystemObject -eq $false}
        if($Res){$Objects += $Res}
		$Filter = ""
		GenScripts "Roles"

		        $Objects = @()            
        Write-Progress -Activity "Script $dbName..." -status "Users" -percentComplete 0
        $Res = $db.Users | where {$_.IsSystemObject -eq $false}
        if($Res){$Objects += $Res}
		$Filter = ""
		GenScripts "Users"

		
        $Objects = @()            
        Write-Progress -Activity "Script $dbName..." -status "User Defined Data Types" -percentComplete 0
        $Res = $db.UserDefinedDataTypes | where {$_.IsSystemObject -eq $false}
        if($Res){$Objects += $Res}
		$Filter = ""
		GenScriptsWithDependencies "UserDefinedDataTypes"
        
        $Objects = @()            
        Write-Progress -Activity "Script $dbName..." -status "User Defined Table Types" -percentComplete 0
        $Res = $db.UserDefinedTableTypes | where {$_.IsSystemObject -eq $false}
        if($Res){$Objects += $Res}
		$Filter = ""
		GenScriptsWithDependencies "UserDefinedTableTypes"

        $Objects = @()            
        Write-Progress -Activity "Script $dbName..." -status "Sequences" -percentComplete 0
        $Res = $db.Sequences | where {$_.IsSystemObject -eq $false}
        if($Res){$Objects += $Res}
		$Filter = ""
		GenScriptsWithDependencies "Sequences"

		$Objects = @()
        Write-Progress -Activity "Script $dbName..." -status "Tables" -percentComplete 0
        $Res = $db.Tables | where {$_.IsSystemObject -eq $false}
        if($Res){$Objects += $Res}
        $Filter = "StoredProcedure"
        GenScriptsWithDependencies "Tables"

        $Objects = @()        
        Write-Progress -Activity "Script $dbName..." -status "User Defined Functions" -percentComplete 0
        $Res = $db.UserDefinedFunctions | where {$_.IsSystemObject -eq $false}
        if($Res) { $Objects += $Res }
		$Filter = "StoredProcedure"
        GenScriptsWithDependencies "UserDefinedFunctions"

        $Objects = @()
        Write-Progress -Activity "Script $dbName..." -status "Views" -percentComplete 0
        $Res = $db.Views | where {$_.IsSystemObject -eq $false}
        if($Res){ $Objects += $Res }
        $Filter = "StoredProcedure"
        GenScriptsWithDependencies "Views"

		$Objects = @()
        Write-Progress -Activity "Script $dbName..." -status "Synonyms" -percentComplete 0
        $Res = $db.Synonyms #| where {$_.IsSystemObject -eq $false}
        if($Res) { $Objects += $Res }
        $Filter = "StoredProcedure"
        GenScripts "Synonyms"
            
        $Objects = @()            
        Write-Progress -Activity "Script $dbName..." -status "DB Triggers" -percentComplete 0
        $Res = $db.Triggers | where {$_.IsSystemObject -eq $false}
        if($Res){ $Objects += $Res }
        $Filter = "StoredProcedure"
        GenScriptsWithDependencies "Triggers"
            
        $Objects = @()
        Write-Progress -Activity "Script $dbName..." -status "Procedures" -percentComplete 0
        $Res = $db.StoredProcedures | where {$_.IsSystemObject -eq $false} 
        if($Res){ $Objects += $Res }
        $Filter = "" 
        GenScripts "StoredProcedures"

    } catch {
        "EXCEPTION: " + $_.Exception.GetBaseException().Message
        throw $_.Exception
    }

    "Done. " + $count + " Scripts created." 
	#explorer $scriptPath
}

	#$args = "EdFi_Ods", "EduId_Db", "EdFi_Admin"

foreach ($dbname in $args) {
	GenerateDBScript $dbname
	}
