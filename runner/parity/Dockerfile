FROM centos
ARG RUSTVER
ARG DATETIME

RUN yum install -y git curl gcc gcc-c++ libudev-devel openssl-devel jq tmux emacs
# RUN curl https://sh.rustup.rs -sSf | sh -s -- -y
RUN curl https://sh.rustup.rs -sSf | sh -s -- -y --default-toolchain ${RUSTVER}

ENV refreshed_on ${DATETIME}
RUN git clone https://github.com/integer32llc/parity-setup.git
RUN git clone https://github.com/input-output-hk/parity.git

WORKDIR /parity
RUN git checkout ouroboros

VOLUME /out
CMD export PATH=$PATH:/root/.cargo/bin &&\
    cargo build --release &&\
    cp target/release/parity /out
