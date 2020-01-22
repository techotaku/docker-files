FROM alpine

LABEL maintainer "Ian Li <OpenSource@ianli.xyz>"

ARG FRP_VERSION=0.31.1

RUN apk add --no-cache wget && \ 
    wget --no-check-certificate https://github.com/fatedier/frp/releases/download/v${FRP_VERSION}/frp_${FRP_VERSION}_linux_amd64.tar.gz && \ 
    tar xzf frp_${FRP_VERSION}_linux_amd64.tar.gz && \
    cd frp_${FRP_VERSION}_linux_amd64 && \
    mv frpc /frpc && \
    cd .. && \
    rm -rf *.tar.gz && \
    rm -rf frp_${FRP_VERSION}_linux_amd64 && \
    apk del wget && \
    rm -rf /var/cache/apk/*

ENTRYPOINT ["/frpc"]
