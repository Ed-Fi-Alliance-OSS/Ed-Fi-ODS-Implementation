# SPDX-License-Identifier: Apache-2.0
# Licensed to the Ed-Fi Alliance under one or more agreements.
# The Ed-Fi Alliance licenses this file to you under the Apache License, Version 2.0.
# See the LICENSE and NOTICES files in the project root for more information.

# Starts up a Linux container to generate certificate, so that you don't need to
# have a WSL kernel installed.

docker run --name cert -v ./ssl:/ssl -v .:/app -d debian:stable-slim tail -f /dev/null

@"
apt-get update
apt-get install -y openssl
chmod +x /app/generate-cert.sh
sed -i 's/\r//g' /app/generate-cert.sh
/app/generate-cert.sh
#
"@ | docker exec -i cert /bin/bash

docker cp cert:/ssl/dhparam.pem ./ssl
docker cp cert:/ssl/server.crt ./ssl
docker cp cert:/ssl/server.key ./ssl

docker stop cert
docker rm cert