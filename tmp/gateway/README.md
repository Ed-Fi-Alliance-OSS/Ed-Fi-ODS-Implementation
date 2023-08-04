# gateway

A simple NGiNX configuration for local testing. By default, enables

* https://{HOSTNAME}/api
* https://{HOSTNAME}/swagger

First time setup: run `generate-cert.sh` from a Bash prompt to create a
self-signed certificate in the `ssl` directory.

> **NOTE**
> Not intended for distribution
