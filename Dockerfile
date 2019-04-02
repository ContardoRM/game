FROM alpine
ENV TINI_VERSION v0.16.1
ADD https://github.com/krallin/tini/releases/download/${TINI_VERSION}/tini-static /sbin/tini
RUN chmod +x /sbin/tini
RUN apk add --no-cache apache2 \
   && mkdir -p /run/apache2 \
   && ln -sf /dev/stdout /var/log/apache2/access.log \
   && ln -sf /dev/stderr /var/log/apache2/error.log
ADD game/ var/www/localhost/htdocs/
EXPOSE 80
ENTRYPOINT ["/sbin/tini", "-vvv", "-g", "--"]
CMD ["/usr/sbin/httpd", "-f", "/etc/apache2/httpd.conf", "-DFOREGROUND"]
