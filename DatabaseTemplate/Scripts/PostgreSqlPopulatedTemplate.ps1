# SPDX-License-Identifier: Apache-2.0
# Licensed to the Ed-Fi Alliance under one or more agreements.
# The Ed-Fi Alliance licenses this file to you under the Apache License, Version 2.0.
# See the LICENSE and NOTICES files in the project root for more information.

$params = @{
    packageName = "EdFi.Ods.Populated.Template.PostgreSQL"
    packageVersion = "4.0.0-b10149"
    packageSource = "https://www.myget.org/F/ed-fi/"
}

& "$PSScriptRoot\..\Modules\get-populated-from-nuget.ps1" @params

return "$global:templateDatabaseFolder\EdFi.Ods.Populated.Template.sql"
