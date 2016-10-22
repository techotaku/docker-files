FROM ubuntu:latest

MAINTAINER Ian Li <OpenSource@ianli.xyz>

RUN apt-get update && apt-get install --no-install-recommends -y \ 
    build-essential git ruby ruby-dev \
    && rm -rf /var/lib/apt/lists/*

ADD https://raw.githubusercontent.com/techotaku/docker-files/master/ubuntu-cn/sources.list /etc/apt/sources.list

RUN gem update --system && gem install bundler \
    && gem sources --add https://gems.ruby-china.org/ --remove https://rubygems.org/ \
    && bundle config mirror.https://rubygems.org https://gems.ruby-china.org

CMD ["/bin/bash"]