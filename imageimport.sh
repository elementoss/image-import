#!/bin/bash

FROM_DIR=$(pwd)
TO_DIR=$(pwd)
MOVE=false

while getopts f:t:m option
do
    case "${option}"
    in
        f) FROM_DIR=${OPTARG};;
        t) TO_DIR=${OPTARG};;
        m) MOVE=true
    esac
done

for x in $(ls $FROM_DIR); do
    file=$FROM_DIR/$x;
    if [ ${file: -4} == ".jpg" ]; then
        d=$(date -r "$file" +%Y_%m_%d)
        mkdir -p "$TO_DIR$d"
        if $MOVE ; then
            mv "$file" "$TO_DIR$d/"
            echo "$x move to $TO_DIR$d/"
        else
            cp "$file" "$TO_DIR$d/"
            echo "$x copy to $TO_DIR$d/"
        fi
    fi
done


