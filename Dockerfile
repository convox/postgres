FROM alpine:3.3

RUN apk add --update curl mysql mysql-client && \
    rm -rf /var/cache/apk/*

RUN curl -o /usr/local/bin/gosu -sSL "https://github.com/tianon/gosu/releases/download/1.2/gosu-amd64"
RUN chmod +x /usr/local/bin/gosu

ENV MYSQL_USERNAME mysql
ENV MYSQL_ROOT_PASSWORD password
ENV MYSQL_PASSWORD password
ENV MYSQL_DATABASE app

ENV LINK_SCHEME mysql
ENV LINK_USERNAME mysql
ENV LINK_PASSWORD password
ENV LINK_PATH /app

ENV LANG en_US.utf8
ENV MYSQL_CONF /etc/mysql
ENV MYSQL_DATA /var/lib/mysql
ENV MYSQL_INITFILE /init.sql
ENV MYSQL_RUN /run/mysqld
ENV TERM dumb
VOLUME /var/lib/mysql

COPY docker-entrypoint.sh /

ENTRYPOINT ["/docker-entrypoint.sh"]

EXPOSE 3306
CMD ["mysqld"]
