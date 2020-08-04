FROM nginx:alpine

WORKDIR /application

RUN apk --no-cache add wget && cd /tmp && \
    wget https://github.com/tsenart/vegeta/releases/download/v12.8.3/vegeta-12.8.3-linux-amd64.tar.gz && \
    tar -xvf vegeta-12.8.3-linux-amd64.tar.gz && rm vegeta-12.8.3-linux-amd64.tar.gz && \
    mv vegeta /application && apk del wget && cd /application && mkdir html && rm -rf /tmp/*

COPY ./vegeta/benchmark.sh /application
COPY ./vegeta/index.html /application/html
COPY ./vegeta/nginx.conf /etc/nginx/conf.d/default.conf