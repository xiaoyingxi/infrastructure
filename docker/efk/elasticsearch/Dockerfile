FROM elasticsearch:5.5.1

RUN elasticsearch-plugin install http://pilipa-assets.oss-cn-beijing.aliyuncs.com/soft/x-pack-5.5.1.zip 
ADD http://pilipa-assets.oss-cn-beijing.aliyuncs.com/soft/x-pack-5.5.1.jar /usr/share/elasticsearch/plugins/x-pack/x-pack-5.5.1.jar
RUN chown root:root /usr/share/elasticsearch/plugins/x-pack/x-pack-5.5.1.jar && chmod 644 /usr/share/elasticsearch/plugins/x-pack/x-pack-5.5.1.jar
ENV ES_JAVA_OPTS="-Xms4g -Xmx4g"




