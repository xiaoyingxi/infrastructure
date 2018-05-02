FROM fluent/fluentd:v0.12-onbuild

ENV TZ=Asia/Shanghai
RUN echo "http://mirrors.aliyun.com/alpine/v3.5/main" >/etc/apk/repositories \ 
        && echo "http://mirrors.aliyun.com/alpine/v3.5/community" >>/etc/apk/repositories \
        && apk add --update tzdata \
        && apk add curl \
        && ln -snf /usr/share/zoneinfo/$TZ /etc/localtime \
        && echo $TZ > /etc/timezone

RUN apk add  --virtual .build-deps \
        sudo build-base ruby-dev \
&& sudo gem install \
        fluent-plugin-elasticsearch \
&& sudo gem sources --clear-all \
&& apk del .build-deps \
&& rm -rf /var/cache/apk/* \
          /home/fluent/.gem/ruby/2.3.0/cache/*.gem

COPY fluent.conf /fluentd/etc/fluent.conf
