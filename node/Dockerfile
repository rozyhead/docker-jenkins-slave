FROM rozyhead/jenkins-slave:base
MAINTAINER Takeshi Miyajima <rozyhead@gmail.com>

ENV NODE_VERSION=v6.9.1

RUN wget -O - https://nodejs.org/dist/$NODE_VERSION/node-$NODE_VERSION-linux-x64.tar.xz | tar Jxf - && \
    mv node-$NODE_VERSION-linux-x64 /opt/node && \
    ln -s /opt/node/bin/node /usr/local/bin/node && \
    ln -s /opt/node/bin/npm /usr/local/bin/npm && \
    npm install -g yarn && \
    ln -s /opt/node/bin/yarn /usr/local/bin/yarn && \
    ln -s /opt/node/bin/yarnpkg /usr/local/bin/yarnpkg

