#!/bin/bash

set -ex

export SERVICE_NAME='pilipa-jenkins'
export IMAGE_NAME='ciregistry.i-counting.cn:8443/pilipa/tools/jenkins'
export RUNNING=`docker service ls |grep $SERVICE_NAME | wc -l`

if [ "$RUNNING" == 1 ];then
    echo "Updating an existing service '$SERVICE_NAME'"
    DATE=$(TZ="Asia/Shanghai" date +"%Y%m%d-%H%M%S")
    docker service update --force --image "$IMAGE_NAME" --container-label-add "deploy=$DATE" \
    "$SERVICE_NAME"
else
    echo "Create a new service '$SERVICE_NAME'"
    docker service create --name "$SERVICE_NAME" --network pilipa-network --replicas 1 \
      --mount type=bind,src=/srv/volume/jenkins,dst=/var/jenkins_home \
    "$IMAGE_NAME"
fi
