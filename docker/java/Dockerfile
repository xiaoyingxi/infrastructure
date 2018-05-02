FROM fabric8/java-jboss-openjdk8-jdk:1.4

USER root
COPY check.sh /scripts/
COPY run-env.sh /deployments/
RUN curl -o /bin/jq -L https://github.com/stedolan/jq/releases/download/jq-1.5/jq-linux64 \
	&& chmod +x /bin/jq \
	&& chmod +x /deployments/run-env.sh \
	&& chmod +x /scripts/check.sh 

HEALTHCHECK --start-period=30s --interval=5s --timeout=3s --retries=30 CMD /bin/sh /scripts/check.sh $URL

ENV JAVA_OPTIONS="-server -XX:+HeapDumpOnOutOfMemoryError -XX:HeapDumpPath=/var/yuuyoo/vmlog \
				-Dspring.profiles.active=production -Deureka.instance.hostname=\${HOST} \
                -Duser.timezone=Asia/Shanghai"
ENV JAVA_APP_JAR="app.jar"
ENV JAVA_MAX_MEM_RATIO=50
ENV AB_OFF ""

VOLUME /var/yuuyoo
VOLUME /var/yuuyoo/vmlog
