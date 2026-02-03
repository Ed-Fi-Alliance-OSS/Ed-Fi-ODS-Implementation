# SPDX-License-Identifier: Apache-2.0
# Licensed to the Ed-Fi Alliance under one or more agreements.
# The Ed-Fi Alliance licenses this file to you under the Apache License, Version 2.0.
# See the LICENSE and NOTICES files in the project root for more information.

<#
.SYNOPSIS
Generates a new RSA public/private key pair and outputs them in PEM and JSON formats.

.DESCRIPTION
This function creates a 2048-bit RSA key pair, displays the private and public keys in PEM format, and also outputs their JSON representations for use in appsettings.json.

.EXAMPLE
Import-Module "./public-private-key-pair.psm1"
New-PublicPrivateKeyPair
This command generates a new 2048-bit RSA key pair.
#>
function New-PublicPrivateKeyPair {

	$rsa = [System.Security.Cryptography.RSA]::Create(2048)

	# Export Private Key (for the API to sign tokens)
	$privateKey = $rsa.ExportPkcs8PrivateKeyPem()

	# Export Public Key (for the API and Node.js to verify tokens)
	$publicKey = $rsa.ExportSubjectPublicKeyInfoPem()

	$rsa.Dispose()

	return [PSCustomObject]@{
    PrivateKey = $privateKey
    PublicKey = $publicKey
	}
}

Export-ModuleMember -Function New-PublicPrivateKeyPair
