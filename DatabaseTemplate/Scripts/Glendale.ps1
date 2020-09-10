# SPDX-License-Identifier: Apache-2.0
# Licensed to the Ed-Fi Alliance under one or more agreements.
# The Ed-Fi Alliance licenses this file to you under the Apache License, Version 2.0.
# See the LICENSE and NOTICES files in the project root for more information.

$params = @{
    sourceUrl = "https://odsassets.blob.core.windows.net/public/Glendale/EdFi_Ods_Glendale_v500_20200909.7z"
    fileName  = "EdFi_Ods_Glendale_v500_20200909.7z"
}

& "$PSScriptRoot\..\Modules\get-populated-from-web.ps1" @params
