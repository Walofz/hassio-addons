FROM honeygain/honeygain:0.8.1

USER root
RUN apt-get update
RUN apt-get install -y --no-install-recommends jq bash dos2unix && \
    rm -rf /var/lib/apt/lists/*

# RUN usermod -a -G root appuser
COPY addon_run.sh /addon_run.sh
RUN dos2unix /addon_run.sh && \
    chmod a+x /addon_run.sh

# USER appuser
ENTRYPOINT [ "/addon_run.sh" ]
CMD []