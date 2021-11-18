#!/bin/bash

echo "content-type: text/plain"

md5=$(echo ${CACHE_KEY} | md5sum | awk '{print $1}');

echo $md5
echo ${CACHE_KEY}
echo /var/www/images/$md5

if [ -f "/var/www/images/$md5" ]
then
    rm /var/www/images/$md5
fi

if [ -d "/var/www/images/$md5" ]
then
    rm -rf /var/www/images/$md5
fi