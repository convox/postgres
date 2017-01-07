FROM postgres:9.6-alpine
MAINTAINER Convox <support@convox.com>

RUN apk update \
    && apk add curl \
    && curl -o /usr/local/bin/gosu -sSL "https://github.com/tianon/gosu/releases/download/1.2/gosu-amd64"

RUN chmod +x /usr/local/bin/gosu

ENV \
    POSTGRES_USER postgres \
    POSTGRES_PASSWORD password \
    POSTGRES_DATABASE app \
    LINK_SCHEME postgres \
    LINK_USERNAME postgres \
    LINK_PASSWORD password \
    LINK_PATH /app \
    LANG en_US.utf8 \
    PGDATA /var/lib/postgresql/data

VOLUME /var/lib/postgresql/data

COPY docker-entrypoint.sh /

ENTRYPOINT ["/docker-entrypoint.sh"]

EXPOSE 5432
CMD ["postgres"]
