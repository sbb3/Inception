FROM alpine:3.16

RUN apk update && apk add --no-cache redis

#listen to all network interfaces or addresses
#Redis server runs in the protected mode which restricts external access from clients to the Redis server that are not running on the same host as Redis.
RUN sed -i 's/bind 127.0.0.1 -::1/#bind 127.0.0.1 -::1/' /etc/redis.conf \
	&& echo "maxmemory 500mb" >> /etc/redis.conf \
	&& echo "maxmemory-policy allkeys-lru" >> /etc/redis.conf

CMD sh -c "redis-server --protected-mode no"

# flush the cache after any edit
# wp cli: wp cache flush
# redis cli: redis-cli flushall
