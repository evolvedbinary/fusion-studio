FROM centos:7

MAINTAINER Evolved Binary Ltd <tech@evolvedbinary.com>

LABEL name="CentOS 7 (x64) Fusion Studio Build Environment" \
  vendor="Evolved Binary Ltd"

RUN sed -i 's/^\(override_install_langs=.*$\)/#\1/' /etc/yum.conf \
  && yum --setopt=tsflags=nodocs -y update \
  && yum --setopt=tsflags=nodocs -y install epel-release \
  && yum --setopt=tsflags=nodocs -y reinstall glibc-common \
  && yum --setopt=tsflags=nodocs -y upgrade \
  && yum --setopt=tsflags=nodocs -y install gcc-c++ make python-pip ruby-devel ruby-gems \
  && yum --setopt=tsflags=nodocs -y install libxkbfile-devel libX11-devel \
  && yum --setopt=tsflags=nodocs -y install rpm-build openssl wget \
  && yum -y clean all \
  && pip install --upgrade pip \
  && pip install argparse \
  && wget -qO- https://raw.githubusercontent.com/nvm-sh/nvm/v0.35.3/install.sh | bash \
  && source ~/.bash_profile \
  && nvm install 10 \
  && npm install -g yarn

ENV LOCALE=en_US.UTF-8
