#!/bin/bash

/hg-4.5.2/hg init /hgweb/repos/demorepo

cd /hgweb/repos/demorepo

mkdir files

for i in {1..1000}
do
    dd if=/dev/urandom of=files/$i bs=1k count=4
done

/hg-4.5.2/hg add --large files/*

/hg-4.5.2/hg commit -m 'adding largefiles'
