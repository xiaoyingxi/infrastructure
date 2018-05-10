FROM jenkins/jenkins:lts-alpine
USER root

ENV TZ=Asia/Shanghai
RUN echo "http://mirrors.aliyun.com/alpine/v3.5/main" >/etc/apk/repositories \
    && echo "http://mirrors.aliyun.com/alpine/v3.5/community" >>/etc/apk/repositories \
    && apk add --no-cache --update su-exec \
    && rm -rf /var/cache/apk/* \
    && ln -snf /usr/share/zoneinfo/$TZ /etc/localtime \
    && echo $TZ > /etc/timezone
COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh
ENTRYPOINT ["/entrypoint.sh"]
