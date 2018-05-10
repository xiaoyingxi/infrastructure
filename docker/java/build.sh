#!/bin/sh -xe

docker build --no-cache --pull -t yuuyoo/openjdk:1.8 ./

#docker tag yuuyoo/openjdk:1.8 registry-vpc.cn-beijing.aliyuncs.com/yuuyoo/openjdk:1.8