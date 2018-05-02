#!/bin/bash

set -ex

export IMAGE_NAME=yuuyoo/fluentd
export Registry_Url="ciregistry.i-counting.cn:8443"

docker build --no-cache --pull -t $IMAGE_NAME ./

docker tag $IMAGE_NAME $Registry_Url/$IMAGE_NAME

docker push $Registry_Url/$IMAGE_NAME