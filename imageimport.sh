#!/bin/bash

FROM_DIR=$(pwd)
TO_DIR=$(pwd)
MOVE=false

while getopts f:t:m:h option
do
    case "${option}"
    in
        f) FROM_DIR=${OPTARG};;
        t) TO_DIR=${OPTARG};;
        m) MOVE=true;;
        h) echo 'SYNOPSIS'
           echo '   imageimport.sh [OPTION]'
           echo
           echo 'DESCRIPTION'
           echo '   Simple script t copy images from current directory to sub-directories by file create date (YYYY-MM-DD).'
           echo
           echo 'OPTIONS'
           echo '   -f      Copy images from path'
           echo '   -t      Copy images to path'
           echo '   -m      Moves images instead copy'
           echo '   -h      Print this help'
           echo
           echo 'EXAMPLES'
           echo '   imageimport.sh -f /home/user/temp/ -t /home/user/pic/ -m'
           exit 1;
    esac
done

for file in $(ls ${FROM_DIR}); do
    if [[ ${file: -4} == .jpg ]] || [[ ${file: -4} == .JPG ]]  || [[ ${file: -4} == .cr2 ]] || [[ ${file: -4} == .CR2 ]] || [[ ${file: -4} == .nef ]]; then
        path_file=${FROM_DIR}/${file};
        date=$(date -r "$path_file" +%Y_%m_%d)
        mkdir -p "$TO_DIR/$date"
        if ${MOVE} ; then
            mv "$path_file" "$TO_DIR/$date/"
            echo "$file move to $TO_DIR/$date/"
        else
            cp "$path_file" "$TO_DIR/$date/"
            echo "$file copy to $TO_DIR/$date/"
        fi
    fi
done
