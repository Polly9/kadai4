#!/bin/bash
if [ $1 -lt 1 ];then
    echo error
    exit 1
elif [ $2 -lt 1 ];then
    echo error
    exit 1
else
    comm -1 -2 <(factor $1|sed  's/ /\n/g'|sort) <(factor $2|sed 's/ /\n/g'|sort) | awk 'BEGIN{a=1}{a*=$1}END{print a}'
fi
