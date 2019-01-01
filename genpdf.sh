#!/bin/bash

ALLTEX=`find . -name "*.tex"`

REMOVE="aux log toc synctex.gz"

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

for asd in $REMOVE
do
    for file in `find . -name "*.$asd"`
    do
        rm $file
    done
done
