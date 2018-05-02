It's an image inherited from [fabric8/java-jboss-openjdk8-jdk](https://hub.docker.com/r/fabric8/java-jboss-openjdk8-jdk/) with health check capability.

The health check will start in 30 seconds after the container is ran. Then it will check the health every 5 seconds with timeout option 3 seconds. The container will be unhealthy in 2 minutes after the container is ran.
