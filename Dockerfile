FROM centos

RUN yum -y install epel-release && \
  yum -y install \
   curl \
   git \
   python-pip \
   && \
  yum clean all
  
RUN pip install jinja2 PyYaml  

RUN curl -L https://github.com/docker/machine/releases/download/v0.12.2/docker-machine-`uname -s`-`uname -m` >/tmp/docker-machine && \
    chmod +x /tmp/docker-machine && \
    cp /tmp/docker-machine /usr/local/bin/docker-machine
      
RUN curl -L https://github.com/docker/compose/releases/download/1.15.0/docker-compose-`uname -s`-`uname -m` > /usr/local/bin/docker-compose && \
  chmod +x /usr/local/bin/docker-compose  
  
RUN git clone https://github.com/panoptix-za/mini-templates.git && \
  cp mini-templates/mini /usr/local/bin/ && \
  chmod +x /usr/local/bin/mini
  
RUN curl https://sh.rustup.rs -sSf | sh -s -- -y

RUN yum -y install \
  gcc \
  gcc-c++ \
  libudev-devel \
  openssl-devel

RUN export PATH=$PATH:/root/.cargo/bin && \
    cargo install parallel
  
RUN yum install -y yum-utils device-mapper-persistent-data lvm2 && \
 yum-config-manager \
    --add-repo \
    https://download.docker.com/linux/centos/docker-ce.repo && \
 yum makecache fast && \
 yum install -y docker-ce      

VOLUME /shared  

CMD bash