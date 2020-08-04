#!/usr/bin/env sh

curl http://reactphp:8000/provinces > /usr/local/apache2/htdocs/provinces.drift.html
curl http://webserver:80/provinces > /usr/local/apache2/htdocs/provinces.s5.html

sleep 2
ab -g /usr/local/apache2/htdocs/drift.tsv -n 5000 -c 100 http://reactphp:8000/provinces > /usr/local/apache2/htdocs/drift.txt 2>&1
sleep 15
ab -g /usr/local/apache2/htdocs/s5.tsv -n 5000 -c 100 http://webserver:80/provinces > /usr/local/apache2/htdocs/s5.txt 2>&1

gnuplot drift.p
gnuplot drift-ttime.p
gnuplot s5.p
gnuplot s5-ttime.p