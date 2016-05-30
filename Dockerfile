FROM alpine:3.3

RUN apk add --update curl mysql && \
    rm -rf /var/cache/apk/*

RUN curl -o /usr/local/bin/gosu -sSL "https://github.com/tianon/gosu/releases/download/1.2/gosu-amd64"
RUN chmod +x /usr/local/bin/gosu

ENV MYSQL_USERNAME mysql
ENV MYSQL_PASSWORD password
ENV MYSQL_DATABASE app

ENV LINK_SCHEME mysql
ENV LINK_USERNAME mysql
ENV LINK_PASSWORD password
ENV LINK_PATH /app

ENV LANG en_US.utf8
ENV MYSQL_DATA /var/lib/mysql
VOLUME /var/lib/mysql

COPY docker-entrypoint.sh /

ENTRYPOINT ["/docker-entrypoint.sh"]

EXPOSE 3306
CMD ["mysql"]
