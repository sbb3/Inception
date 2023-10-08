FROM alpine:3.16

RUN apk update && apk add --no-cache nginx openssl

COPY ./conf/website.conf /etc/nginx/http.d/
COPY ./tools/generate_cert.sh /usr/local/bin/

RUN chmod +x /usr/local/bin/generate_cert.sh

WORKDIR /var/www/html/

#nginx -g "daemon off;" is a command that starts the Nginx web server in the foreground and prevents it from running as a daemon process. By default, Nginx runs as a daemon process in the background, meaning that it starts up and runs continuously without user intervention.
CMD sh -c "/usr/local/bin/generate_cert.sh && nginx -g 'daemon off;'"
# running in the foreground to keep the container alive and see the logs
#It is common practice for the nginx master process to run as the root user, since it requires elevated privileges to bind to privileged ports (such as port 80 or 443)
