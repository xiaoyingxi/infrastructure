#!/bin/bash

set -x

export IMAGE_NAME=yuuyoo/kibana
export Registry_Url="ciregistry.i-counting.cn:8443"

docker build --no-cache --pull -t $IMAGE_NAME ./

docker tag $IMAGE_NAME $Registry_Url/$IMAGE_NAME

docker push $Registry_Url/$IMAGE_NAME

docker service rm pilipa-inside-kibana

docker service create \
	--name pilipa-inside-kibana \
	--network pilipa-network \
	--replicas 1 \
	--mount type=bind,src=/srv/volume/kibana/kibana.yml,dst=/etc/kibana/kibana.yml \
	--log-driver=json-file \
$Registry_Url/$IMAGE_NAME