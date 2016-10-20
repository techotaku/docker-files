FROM ubuntu:latest

MAINTAINER Ian Li <git@ianli.xyz>

RUN apt-get update && apt-get install --no-install-recommends -y \ 
    build-essential ruby ruby-dev \
	&& rm -rf /var/lib/apt/lists/*

COPY ../ubuntu-cn/sources.list /etc/apt/sources.list

RUN gem update --system && gem install bundler \
    && gem sources --add https://gems.ruby-china.org/ --remove https://rubygems.org/

CMD ["/bin/bash"]