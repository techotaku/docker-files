FROM tarot13/ubuntu-cn:latest

MAINTAINER Ian Li <git@ianli.xyz>

RUN apt-get update && apt-get install --no-install-recommends -y build-essential ruby ruby-dev \
	&& rm -rf /var/lib/apt/lists/*

RUN gem update --system && gem sources --add https://gems.ruby-china.org/ \ 
    --remove https://rubygems.org/ && gem install bundle

CMD ["/bin/bash"]