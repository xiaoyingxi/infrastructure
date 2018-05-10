docker run \
-d \
-p 8081:8081  \
-p 5000:5000  \
--name yuuyoo-nexus \
--mount type=bind,source=/srv/nexus,target=/nexus-data  \
yuuyoo/nexus:latest