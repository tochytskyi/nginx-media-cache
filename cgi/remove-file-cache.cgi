#!/bin/bash
DATA=`date`
echo "content-type: text/plain"
printf '%s' "my string" | md5sum
echo  "The date is: $DATA"