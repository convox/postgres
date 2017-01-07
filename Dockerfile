FROM postgres:9.6-alpine

ENV POSTGRES_USER postgres
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
