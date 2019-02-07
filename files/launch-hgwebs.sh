#!/bin/bash

echo ====================================
echo killing running "hg serve" instances
echo ====================================
echo
for i in $(pgrep python)
do
    kill $i
    sleep 1
done

echo ====================================
echo launching:
echo "/hg-4.5.2/hg serve --port 8000 --webdir-conf /hgweb/hgweb.config 2>&1 >> /hgweb/4.5.2.log"
echo "/hg-4.5.3/hg serve --port 8001 --webdir-conf /hgweb/hgweb.config 2>&1 >> /hgweb/4.5.3.log"
echo ====================================
echo
/hg-4.5.2/hg serve --port 8000 --webdir-conf /hgweb/hgweb.config 2>&1 >> /hgweb/4.5.2.log &
/hg-4.5.3/hg serve --port 8001 --webdir-conf /hgweb/hgweb.config 2>&1 >> /hgweb/4.5.3.log &
