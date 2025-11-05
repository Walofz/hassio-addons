FROM ghcr.io/xterna/honeygain-pot:latest

RUN apk add --no-cache bash jq

COPY run.sh /run.sh
RUN chmod a+x /run.sh

CMD [ "/run.sh" ]