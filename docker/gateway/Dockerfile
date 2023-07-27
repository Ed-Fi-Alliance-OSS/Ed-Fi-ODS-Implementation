# SPDX-License-Identifier: Apache-2.0
# Licensed to the Ed-Fi Alliance under one or more agreements.
# The Ed-Fi Alliance licenses this file to you under the Apache License, Version 2.0.
# See the LICENSE and NOTICES files in the project root for more information.

# Not intended for distribution

FROM nginx:alpine@sha256:da9c94bec1da829ebd52431a84502ec471c8e548ffb2cedbf36260fd9bd1d4d3

ENV ODS_VIRTUAL_NAME=api
ENV SWAGGER_VIRTUAL_NAME=swaggerui

COPY ./default.conf.template /etc/nginx/templates/

EXPOSE 443
