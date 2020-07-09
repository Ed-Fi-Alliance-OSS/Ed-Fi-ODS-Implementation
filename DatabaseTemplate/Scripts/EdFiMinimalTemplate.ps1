# SPDX-License-Identifier: Apache-2.0
# Licensed to the Ed-Fi Alliance under one or more agreements.
# The Ed-Fi Alliance licenses this file to you under the Apache License, Version 2.0.
# See the LICENSE and NOTICES files in the project root for more information.

$params = @{
    packageName    = "EdFi.Ods.Minimal.Template.Suite3"
    packageVersion = "5.0.0-b10202"
    packageSource  = "https://www.myget.org/F/ed-fi/"
}

& "$PSScriptRoot\..\Modules\get-populated-from-nuget.ps1" @params
