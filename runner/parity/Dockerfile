FROM centos

RUN yum install -y git curl gcc gcc-c++ libudev-devel openssl-devel jq tmux emacs
# RUN curl https://sh.rustup.rs -sSf | sh -s -- -y
ARG RUSTVER
RUN curl https://sh.rustup.rs -sSf | sh -s -- -y --default-toolchain ${RUSTVER}

RUN git clone https://github.com/integer32llc/parity-setup.git
RUN git clone https://github.com/input-output-hk/parity.git

ARG DATETIME
ENV refreshed_on ${DATETIME}

WORKDIR /parity-setup
RUN git pull
WORKDIR /parity
RUN git checkout ouroboros
RUN git pull

VOLUME /parity/target/release/
VOLUME /root/.cargo/
VOLUME /out/

CMD export PATH=$PATH:/root/.cargo/bin &&\
    cargo build --release
