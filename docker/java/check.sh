#!/bin/sh -xe

URL=$1

if [ "$URL" == "" ];then
    exit 1
fi

Output=`curl -s $URL | jq -r '.status'`
if [ "$Output" == "UP" ];then
    exit 0
else
    exit 1
fi