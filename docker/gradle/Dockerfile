FROM gradle:4.2-jdk

USER gradle
RUN mkdir -p .embedmongo/linux

ADD --chown=gradle:gradle https://pilipa-assets.oss-cn-beijing.aliyuncs.com/soft/mongodb-linux-x86_64-3.4.10.tgz /home/gradle/.embedmongo/linux/
