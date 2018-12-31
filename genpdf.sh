#!/bin/bash

ALLTEX=`find . -name "*.tex"`
echo $ALLTEX

CWD=`pwd`

for file in $ALLTEX
do
    if [ -d $file ]; then
        continue
    fi
    dir=${file%/*}
    while [ ${file/\//a} != $file ]
    do
        file=${file#*/}
    done
    echo "( @ - @ ) enter : $dir"
    cd $dir
    echo "( @ - @ ) xelatex : $file"
    xelatex $file 
    cd $CWD
done

for file in `find . -name "*.aux"`
do
    rm $file
done

for file in `find . -name "*.log"`
do
    rm $file
done
