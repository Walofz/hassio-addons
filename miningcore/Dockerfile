FROM theretromike/miningcore:latest

RUN apt-get update && apt-get install -y wget dos2unix && rm -rf /var/lib/apt/lists/*

COPY run.sh /run.sh
RUN dos2unix /run.sh && chmod a+x /run.sh

WORKDIR /app/build
ENTRYPOINT [ "/run.sh" ]