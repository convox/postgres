FROM gliderlabs/alpine:3.3

RUN apk-install curl

RUN curl -o /usr/local/bin/gosu -sSL "https://github.com/tianon/gosu/releases/download/1.2/gosu-amd64"
RUN chmod +x /usr/local/bin/gosu

RUN apk-install "postgresql"
RUN apk-install "postgresql-contrib"

ENV POSTGRES_USERNAME postgres
ENV POSTGRES_PASSWORD password
ENV POSTGRES_DATABASE app

ENV LINK_SCHEME postgres
ENV LINK_USERNAME postgres
ENV LINK_PASSWORD password
ENV LINK_PATH /app

ENV LANG en_US.utf8
ENV PGDATA /var/lib/postgresql/data
VOLUME /var/lib/postgresql/data

COPY docker-entrypoint.sh /

ENTRYPOINT ["/docker-entrypoint.sh"]

EXPOSE 5432
CMD ["postgres"]
