#!/bin/bash

set -x

export IMAGE_NAME=yuuyoo/elasticsearch
export Registry_Url="ciregistry.i-counting.cn:8443"

docker build --no-cache --pull -t $IMAGE_NAME ./

docker tag $IMAGE_NAME $Registry_Url/$IMAGE_NAME

docker push $Registry_Url/$IMAGE_NAME

docker service rm pilipa-inside-elasticsearch

docker service create \
	--name pilipa-inside-elasticsearch \
	--network pilipa-network \
	--replicas 1 \
	--mount type=bind,src=/srv/volume/es/data,dst=/usr/share/elasticsearch/data \
	--mount type=bind,src=/srv/volume/es/elasticsearch.yml,dst=/usr/share/elasticsearch/config/elasticsearch.yml \
	--log-driver=json-file \
	--env ES_JAVA_OPTS="-Xms4g -Xmx4g" \
$Registry_Url/$IMAGE_NAME
