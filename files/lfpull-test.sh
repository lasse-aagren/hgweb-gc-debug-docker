#!/bin/bash

/hgweb/launch-hgwebs.sh
sleep 3

echo cloning demo repo
echo =======================
cd /workdir
hg clone --noupdate --uncompressed http://localhost:8000/demorepo
cd demorepo
echo =======================
echo

### OUTPUT
echo testing hg-4.5.2 with
echo =======================
echo cd demorepo
echo hg --traceback --config largefiles.usercache=/tmp/lf --time lfpull -r default http://localhost:8000/demorepo
echo rm -rf .hg/largefiles/* /tmp/lf/*
echo =======================
###

for i in {1..3}
do
    echo
    echo "${i}. run with hg 4.5.2"
    echo =======================
    hg --traceback --config largefiles.usercache=/tmp/lf --time lfpull -r default http://localhost:8000/demorepo
    rm -rf .hg/largefiles/* /tmp/lf/*
    echo =======================
done


### OUTPUT
echo
echo testing hg-4.5.3 with
echo =======================
echo cd demorepo
echo hg --traceback --config largefiles.usercache=/tmp/lf --time lfpull -r default http://localhost:8001/demorepo
echo rm -rf .hg/largefiles/* /tmp/lf/*
echo =======================
###

for i in {1..3}
do
    echo
    echo "${i}. run with hg 4.5.3"
    echo =======================
    hg --traceback --config largefiles.usercache=/tmp/lf --time lfpull -r default http://localhost:8001/demorepo
    rm -rf .hg/largefiles/* /tmp/lf/*
    echo =======================
done
