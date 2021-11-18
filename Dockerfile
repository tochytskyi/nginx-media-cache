FROM nginx:1.21

ADD entrypoint.sh /
RUN chmod +x /entrypoint.sh

RUN DEBIAN_FRONTEND=noninteractive && \
    apt update && \
    apt dist-upgrade -y && \
    apt install -y nginx-extras fcgiwrap && \
    rm -rf /var/cache/apt && rm -rf /var/lib/apt

COPY ./cgi/* /usr/lib/cgi-bin/

RUN mkdir -p /var/cache/nginx/images \
    && chown -R nginx:nginx /var/cache/nginx/images \
    && mkdir -p /usr/lib/cgi-bin \
    && chown -R nginx.nginx /usr/lib/cgi-bin/* \
    && chmod -R 755 /usr/lib/cgi-bin/* \
    && touch /var/run/fcgiwrap.sock \
    && chown nginx:nginx /var/run/fcgiwrap.sock

CMD ["/entrypoint.sh"]