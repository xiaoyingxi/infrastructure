docker run   \
-d   \
--name yuuyoo-jenkins   \
-p 8080:8080   \
-p 50000:50000   \
--restart always \
--mount type=bind,source=/srv/jenkins,target=/var/jenkins_home \
--mount type=bind,source=/var/run/docker.sock,target=/var/run/docker.sock   \
yuuyoo/jenkins:latest