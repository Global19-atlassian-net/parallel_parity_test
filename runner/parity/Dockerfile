FROM centos

RUN yum install -y git curl gcc gcc-c++ libudev-devel openssl-devel jq tmux emacs
# RUN curl https://sh.rustup.rs -sSf | sh -s -- -y
RUN curl https://sh.rustup.rs -sSf | sh -s -- -y --default-toolchain 1.18.0

ENV refreshed_on 28 Jul 2017 21:07
RUN git clone https://github.com/integer32llc/parity-setup.git
RUN git clone https://github.com/input-output-hk/parity.git

WORKDIR /parity
RUN git checkout ouroboros

VOLUME /out
CMD export PATH=$PATH:/root/.cargo/bin &&\
    cargo build --release &&\
    cp target/release/parity /out
