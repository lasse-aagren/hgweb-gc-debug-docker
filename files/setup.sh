#/bin/bash

/hg-4.5.2/hg serve --port 8000 --webdir-conf /hgweb/hgweb.config 2>&1 > 4.5.2.log &

/hg-4.5.2/hg init /hgweb/repos/demorepo
cd /hgweb/repos/demorepo
mkdir files
for i in {1..1000}; do dd if=/dev/urandom of=files/$i bs=1k count=4; done
/hg-4.5.2/hg add --large files/*
/hg-4.5.2/hg commit -m 'adding largefiles'
