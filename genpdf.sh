#!/bin/bash

ALLTEX=`find . -name "*.tex"`

CWD=`pwd`

for file in $ALLTEX
do
    if [ -d $file ]; then
        continue
    fi
    echo "( @ - @ ) process   : $file"
    dir=${file%/*}
    fn=${file##*/}
    if [ -f ${file%tex}pdf ]; then
        echo "( @ - @ ) ${fn%tex}pdf already exists"
        continue
    fi
    echo "( @ - @ ) enter dir : $dir"
    cd $dir
    echo "( @ - @ ) xelatex   : $fn"
    xelatex $fn 
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
