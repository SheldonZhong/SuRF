FROM ubuntu

WORKDIR /root

RUN apt-get update && \
    DEBIAN_FRONTEND="noninteractive" \
    apt-get install -y --no-install-recommends \
                  build-essential cmake libgtest.dev \
                  git python default-jre curl

COPY . ./SuRF

RUN cd SuRF && \
    git submodule init && \
    git submodule update && \
    mkdir build && \
    cd build && \
    cmake .. && \
    make -j

