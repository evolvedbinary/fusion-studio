FROM centos:7

LABEL maintainer="Evolved Binary Ltd <tech@evolvedbinary.com>"

RUN yum -y update && \
  yum -y install centos-release-scl && \
  yum-config-manager --enable rhel-server-rhscl-7-rpms && \
  yum -y install devtoolset-8-gcc devtoolset-8-gcc-c++ && \
  source scl_source enable devtoolset-8 && \
  yum -y install epel-release && \
  yum -y install gcc-c++ make python-pip ruby-devel ruby-gems && \
  yum -y install libxkbfile-devel libX11-devel libsecret && \
  yum -y install openssl wget && \
  yum -y install https://harbottle.gitlab.io/wine32/7/i386/wine32-release.rpm && \
  yum -y install wine.i686 && \
  pip install argparse && \
  wget -qO- https://raw.githubusercontent.com/nvm-sh/nvm/v0.38.0/install.sh | bash && \
  source /root/.bashrc && \
  nvm install 14 && \
  npm i -g yarn

COPY force-download.js /root
COPY build.sh /root
