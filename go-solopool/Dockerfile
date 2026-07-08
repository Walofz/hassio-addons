FROM ghcr.io/walofz/go-solopool/solo-proxy:latest

RUN apk add --no-cache jq tzdata bash

COPY run.sh /app/run.sh
RUN chmod +x /app/run.sh

CMD ["/app/run.sh"]