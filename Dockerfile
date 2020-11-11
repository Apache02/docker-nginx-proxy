FROM alpine:3.12

RUN apk update && apk add --no-cache nginx

COPY docker-entrypoint.sh /
RUN chmod +x /docker-entrypoint.sh
EXPOSE 80

# example
CMD ["httpbin.org"]

ENTRYPOINT ["/docker-entrypoint.sh"]
