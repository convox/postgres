# PostgreSQL docker image based on Alpine Linux

This repo builds a docker image that accepts POSTGRES_USERNAME, POSTGRES_PASSWORD,
and POSTGRES_DATABASE env vars, in addition to the same env vars as the
[official postgres build](https://registry.hub.docker.com/_/postgres/) but
with a much smaller footprint. It achieves that by basing itself off the great
[alpine](https://github.com/gliderlabs/docker-alpine) docker image by GliderLabs.

## Why?

```bash
$ docker images
REPOSITORY          TAG         VIRTUAL SIZE
alpine-postgres     latest      27.7 MB
postgres            latest      213.9 MB
```

# Build

```bash
$ make build
```
