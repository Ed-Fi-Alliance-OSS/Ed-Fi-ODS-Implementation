# SPDX-License-Identifier: Apache-2.0
# Licensed to the Ed-Fi Alliance under one or more agreements.
# The Ed-Fi Alliance licenses this file to you under the Apache License, Version 2.0.
# See the LICENSE and NOTICES files in the project root for more information.

#This is super simple for processing the parms because my use case is simple too, right now.
#For more advanced scenarios (Like where what you are passing contains "=") a different implementation should be sought.
try {
	Write-Host "Processing installation arguments..."
	$installArgsSets = $env:chocolateyInstallArguments.TrimStart("/") -split ";\s*/"
	$installArgs =@{}
	foreach ($iaSet in $installArgsSets) {
		$iaSetPair = $iaSet -split "="
		$installArgs.Add($iaSetPair[0],$iaSetPair[1].Trim("'").Trim("`""))                #"(Just here for syntax highlighting.)
	}
	Write-Host "Done."
	Write-Host "Validating parameters..."
	#Validate parms
	$requiredParms = @("environment","certPrefix","pathResolverRepositoryOverride","installType")
	foreach ($parm in $requiredParms) {
		if ("$($installArgs.$parm)" -eq "") {
			Write-ChocolateyFailure "$packageName" "The $parm installation argument was not specified. (Try: -ia '/$parm='<value>'')"
		}
		else {
			Write-Host "The $parm installation argument is: $($installArgs.$parm)"
		}
	}
}
catch {
    Write-ChocolateyFailure "$packageName" "$($_.Exception.Message)"
    throw
}
try {
    #Call to central script
    . $env:chocolateyPackageFolder\Deployment.ps1 $installArgs.environment $installArgs.pathResolverRepositoryOverride $installArgs.certPrefix $installArgs.installType
}
catch {
    Write-ChocolateyFailure "$packageName" "$($_.Exception.Message)"
    throw
}
