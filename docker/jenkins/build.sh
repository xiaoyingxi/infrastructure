#!/bin/bash

set -ex

export IMAGE_NAME=yuuyoo/jenkins
export Registry_Url="registry.yuuyoo.com"

docker build --no-cache --pull -t $IMAGE_NAME ./

docker tag $IMAGE_NAME $Registry_Url/$IMAGE_NAME

#docker push $Registry_Url/$IMAGE_NAME
