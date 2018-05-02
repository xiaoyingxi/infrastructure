#!/bin/bash

set -x

docker service rm pilipa-inside-fluentd

docker service create --name pilipa-inside-fluentd \
	--network pilipa-network \
	--publish "mode=host,published=8888,target=8888" \
	--publish "mode=host,published=24224,target=24224" \
	--env FLUENTD_CONF=fluent.conf \
	--log-driver=json-file \
ciregistry.i-counting.cn:8443/pilipa/inside/fluentd
