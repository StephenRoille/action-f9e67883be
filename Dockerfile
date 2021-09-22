FROM alpine
RUN apk update && apk add --no-cache bash httpie jq py3-pip
COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh
ENTRYPOINT ["/entrypoint.sh"]
