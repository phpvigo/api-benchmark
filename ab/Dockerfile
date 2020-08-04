FROM httpd:alpine

WORKDIR /application

RUN apk --no-cache add gnuplot curl

COPY ./ab/benchmark.sh ./ab/plot /application/
COPY ./ab/index.html /usr/local/apache2/htdocs/