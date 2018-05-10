#! /bin/sh
set -e
chown -R 1000 "$JENKINS_HOME"
export JENKINS_OPTS="--sessionTimeout=43200"
export JAVA_OPTS="-Dhudson.tasks.MailSender.SEND_TO_USERS_WITHOUT_READ=true \
                  -Duser.timezone=Asia/Shanghai \
                  -Dhudson.security.csrf.requestfield=Jenkins-Crumb \
                  -Xms1024m \
                  -Xmx1024m \
                  -Xmn1024m \
                  -XX:SurvivorRatio=6 \
                  -XX:PermSize=256m \
                  -XX:MaxPermSize=512m \
                  -XX:ParallelGCThreads=4 \
                  -XX:+UseConcMarkSweepGC \
                  -XX:+HeapDumpOnOutOfMemoryError \
                  -XX:HeapDumpPath=/var/jenkins_home/jvm-dumps \
                  -Dhudson.security.csrf.requestfield=Jenkins-Crumb \
                  -Dhudson.slaves.ChannelPinger.pingIntervalSeconds=30 \
                  -Dhudson.slaves.ChannelPinger.pingTimeoutSeconds=30"
exec su-exec jenkins /bin/tini -- /usr/local/bin/jenkins.sh