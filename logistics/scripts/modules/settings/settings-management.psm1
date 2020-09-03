function Get-DatabaseIds {
    return @{
        master   = @{ database = 'Master'; connectionStringKey = 'EdFi_Master' }
        admin    = @{ database = 'Admin'; connectionStringKey = 'EdFi_Admin' }
        security = @{ database = 'Security'; connectionStringKey = 'EdFi_Security' }
        ods      = @{ database = 'Ods'; connectionStringKey = 'EdFi_Ods' }
    }
}

function Get-Features {
    return @(
        @{
            featureName = "extensions";
        },
        @{
            featureName = "changeQueries";
            subTypeName = "changes"
        },
        @{
            featureName = "ownershipBasedAuthorization";
            subTypeName = "RecordOwnership"
        }
    )
}

function Get-ConnectionStringsByEngine {
    return  @{
        SQLServer  = @{
            ConnectionStrings = @{
                EdFi_Ods      = "Server=(local); Trusted_Connection=True; Database=EdFi_{0};"
                EdFi_Admin    = "Server=(local); Trusted_Connection=True; Database=EdFi_Admin;"
                EdFi_Security = "Server=(local); Trusted_Connection=True; Database=EdFi_Security; Persist Security Info=True;"
                EdFi_Master   = "Server=(local); Trusted_Connection=True; Database=master;"
            }
        }
        PostgreSQL = @{
            ConnectionStrings = @{
                EdFi_Ods      = "Host=localhost; Port=5432; Username=postgres; Database=EdFi_{0};"
                EdFi_Admin    = "Host=localhost; Port=5432; Username=postgres; Database=EdFi_Admin;"
                EdFi_Security = "Host=localhost; Port=5432; Username=postgres; Database=EdFi_Security;"
            }
        }
    }
}

function Get-DevelopmentSettingsByProject {
    return @{
        "EdFi.Ods.WebApi.NetCore"   = @{
            Urls              = "http://localhost:54746"
            Engine            = "SQLServer"
            ConnectionStrings = @{ }
            Logging           = @{
                LogLevel = @{
                    Default = "Debug"
                }
            }
        }
        "EdFi.Ods.SandboxAdmin.Web" = @{
            Urls              = "http://localhost:38928"
            Engine            = "SQLServer"
            ConnectionStrings = @{ }
            Logging           = @{
                LogLevel = @{
                    Default = "Debug"
                }
            }
        }
        "EdFi.Ods.SwaggerUI"        = @{
            Urls             = "http://localhost:56641"
            WebApiVersionUrl = "http://localhost:54746"
            SwaggerUIOptions = @{
                OAuthConfigObject = @{
                    ClientSecret = ""
                    ClientId     = ""
                }
            }
            Logging          = @{
                LogLevel = @{
                    Default = "Debug"
                }
            }
        }
        "EdFi.RestApi.Databases"    = @{
            databaseTemplate = @{
                MinimalTemplateScript   = "EdFiMinimalTemplate"
                PopulatedTemplateScript = "GrandBend"
            }
            Plugin           = @{
                Folder  = "../../../../plugins"
                Scripts = @("development")
            }
        }
    }
}

function Get-ProjectPath {
    param(
        [String] $Project
    )

    if (-not $Project) { return }

    $path = Find-RepositoryResolvedPath "Application/$Project"

    if (-not $path) { $path = Find-RepositoryResolvedPath "Scripts/NuGet/$Project" }

    return $path
}

function Get-Settings {
    param(
        [ValidateSet('SQLServer', 'PostgreSQL')]
        [String] $Engine,

        [String] $Project
    )

    $config = @{ }
    $config += (Get-DevelopmentAppSettingsByProject)[$Project]
    if ($config.ConnectionStrings) { $config += (Get-ConnectionStringsByEngine)[$Engine] }
    if ($Engine -and $config.Engine) { $config.Engine = $Engine }

    return ($config | ConvertTo-Json)
}

function New-DevelopmentConfiguration {
    param(
        [ValidateSet('SQLServer', 'PostgreSQL')]
        [String] $Engine,

        [String] $Project
    )

    $config = @{ }
    $config += (Get-SettingsForProject $Project)
    if ($config.ConnectionStrings) { $config.ConnectionStrings += (Get-ConnectionStringsForEngine $Engine) }
    if ($Engine -and $config.Engine) { $config.Engine = $Engine }

    $path = Get-ProjectPath $Project
    if ($path) {
        $appsettings = Join-Path $path "appsettings.development.json"

        Write-Host "creating $appsettings"
        Write-HashTableInfo ($config)
        $config | ConvertTo-Json -Depth 10 | Out-File -FilePath $appsettings -NoNewline -Encoding UTF8
    }

    return $config
}
