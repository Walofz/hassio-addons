FROM ubuntu:20.04

ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update && apt-get install -y \
    build-essential \
    libtool \
    autotools-dev \
    automake \
    pkg-config \
    libssl-dev \
    libevent-dev \
    bsdmainutils \
    libboost-system-dev \
    libboost-filesystem-dev \
    libboost-chrono-dev \
    libboost-program-options-dev \
    libboost-test-dev \
    libboost-thread-dev \
    libzmq3-dev \
    libdb-dev \
    libdb++-dev \
    git

WORKDIR /src

RUN git clone -b stable https://github.com/aurarad/Auroracoin.git .

RUN ./autogen.sh && \
    ./configure \
    --without-gui \
    --disable-tests \
    --disable-bench \
    --enable-zmq \
    --with-incompatible-bdb

RUN make -j$(nproc) && \
    make install

COPY auroracoin.conf /etc/auroracoin.conf
COPY run.sh /run.sh
RUN chmod a+x /run.sh

EXPOSE 12341 28333

CMD [ "/run.sh" ]