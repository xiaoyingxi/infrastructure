docker run \
-d \
--name yuuyoo-nginx \
-p 80:80   \
-p 443:443 \
--mount type=bind,source=/srv/nginx/nginx.conf,target=/etc/nginx/nginx.conf \
--mount type=bind,source=/srv/nginx/cert,target=/etc/nginx/cert \
--mount type=bind,source=/srv/nginx/conf.d,target=/etc/nginx/conf.d \
--mount type=bind,source=/var/log/nginx,target=/var/log/nginx \
yuuyoo/nginx:1.13-alpine