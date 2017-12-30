FROM ubuntu:latest

LABEL maintainer "Ian Li <OpenSource@ianli.xyz>"

RUN apt-get update && apt-get install --no-install-recommends -y \ 
    build-essential git ruby ruby-dev zlib1g-dev \
    && rm -rf /var/lib/apt/lists/*

RUN gem update --system && gem install bundler github-pages

EXPOSE 4000

CMD ["/bin/bash"]