FROM openjdk:8-jdk
MAINTAINER Takeshi Miyajima <rozyhead@gmail.com>

RUN apt-get -q update && \
    DEBIAN_FRONTEND="noninteractive" apt-get -q install -y -o Dpkg::Options::="--force-confnew" --no-install-recommends \
      locales \
      task-japanese \
      git \
      openssh-server && \
    apt-get -q autoremove && \
    apt-get -q clean && \
    rm -rf /var/lib/apt/lists/* && \
    sed -i "s/# ja_JP.UTF-8/ja_JP.UTF-8/g" /etc/locale.gen && \
    locale-gen && \
    update-locale LANG=ja_JP.UTF-8 && \
    ln -sf /usr/share/zoneinfo/Asia/Tokyo /etc/localtime && \
    sed -i "s/session    required     pam_loginuid.so/session    optional     pam_loginuid.so/g" /etc/pam.d/sshd &&\
    mkdir -p /var/run/sshd

RUN echo "Debian GNU/Linux (on docker for jenkins slave)" > /etc/motd

RUN useradd -m -d /home/jenkins -s /bin/bash jenkins && \
    echo "jenkins:jenkins" | chpasswd

EXPOSE 22

CMD ["/usr/sbin/sshd", "-D"]
