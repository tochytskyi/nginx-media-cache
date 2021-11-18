
/etc/init.d/fcgiwrap start
chown nginx:nginx /var/run/fcgiwrap.sock
chmod g+x /var/run/fcgiwrap.sock
nginx -g 'daemon off;'