# /addons/octobot/Dockerfile
FROM drakkarsoftware/octobot:stable

COPY run.sh /run.sh

RUN chmod a+x /run.sh

ENTRYPOINT ["/run.sh"]