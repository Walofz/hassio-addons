FROM alpine:latest

RUN apk add --no-cache shadowsocks-rust jq

COPY run.sh /run.sh
RUN chmod a+x /run.sh

EXPOSE 8388

CMD [ "/run.sh" ]