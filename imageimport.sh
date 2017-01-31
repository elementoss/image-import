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

for file in $(ls ${FROM_DIR}); do
    if [[ ${file: -4} == .jpg ]] || [[ ${file: -4} == .cr2 ]] || [[ ${file: -4} == .nef ]]; then
        path_file=${FROM_DIR}/${file};
        date=$(date -r "$path_file" +%Y_%m_%d)
        mkdir -p "$TO_DIR$date"
        if ${MOVE} ; then
            mv "$path_file" "$TO_DIR$date/"
            echo "$file move to $TO_DIR$date/"
        else
            cp "$path_file" "$TO_DIR$date/"
            echo "$file copy to $TO_DIR$date/"
        fi
    fi
done


