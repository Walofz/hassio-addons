FROM ghcr.io/xterna/honeygain-pot:latest

RUN apk add --no-cache bash jq

COPY addon_run.sh /addon_run.sh

RUN chmod a+x /addon_run.sh

ENTRYPOINT [ "/addon_run.sh" ]
CMD []