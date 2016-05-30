# convox/postgres

Mysql docker image based on Alpine Linux

This repo builds a docker image that accepts MYSQL_USER, MYSQL_PASSWORD,
and MYSQL_DATABASE env vars, in addition to the same env vars as the
[official postgres build](https://registry.hub.docker.com/_/mysql/) but
with a much smaller footprint. It achieves that by basing itself off the great
[alpine](https://github.com/gliderlabs/docker-alpine) docker image by GliderLabs.

## Usage

```bash
$ docker run -e POSTGRES_PASSWORD=foo -p 5432:5432 convox/postgres
$ psql -h $(boot2docker ip) -p 5432 -U postgres
Password for user postgres: <foo>
psql (9.4.2)
Type "help" for help.

postgres=#
```

## Why?

```bash
$ docker images
REPOSITORY          TAG         VIRTUAL SIZE
convox/postgres     latest      26.98 MB
postgres            latest      213.9 MB
```

Parameterizing POSTGRES_USER, POSTGRES_PASSWORD and POSTGRES_DATABASE is useful
for [linking containers](https://docs.docker.com/userguide/dockerlinks/) together.

# Build

```bash
$ make build
```

## License

Apache 2.0 &copy; 2015 Convox, Inc.

## Credits

Originally forked from [kiasaki/docker-alpine-postgres](https://github.com/kiasaki/docker-alpine-postgres)
