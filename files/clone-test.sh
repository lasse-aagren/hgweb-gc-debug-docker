#!/bin/bash

/hgweb/launch-hgwebs.sh
sleep 3

cd /workdir

echo testing hg-4.5.2
echo =======================
echo with these commands
echo "hg clone --time --config largefiles.usercache=/tmp/lf http://localhost:8000/demorepo"
echo "rm -rf demorepo /tmp/lf/*"
echo =======================

for i in {1..3}
do
    echo
    echo "${i}. run with hg 4.5.2"
    echo =======================
    hg clone --time --config largefiles.usercache=/tmp/lf http://localhost:8000/demorepo
    rm -rf demorepo /tmp/lf/*
    echo =======================
done

echo testing hg-4.5.3
echo =======================
echo with these commands
echo "hg clone --time --config largefiles.usercache=/tmp/lf http://localhost:8001/demorepo"
echo "rm -rf demorepo /tmp/lf/*"
echo =======================
for i in {1..3}
do
    echo
    echo "${i}. run with hg 4.5.3"
    echo =======================
    hg clone --time --config largefiles.usercache=/tmp/lf http://localhost:8001/demorepo
    rm -rf demorepo /tmp/lf/*
    echo =======================
done
