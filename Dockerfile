FROM alpine
RUN apk update && apk add --no-cache bash httpie jq py3-pip
COPY entrypoint.sh /entrypoint.sh
# COPY event.json /event.json
RUN chmod +x /entrypoint.sh
# ENV GITHUB_EVENT_PATH=/event.json
ENTRYPOINT ["/entrypoint.sh"]
