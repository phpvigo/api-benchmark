#!/usr/bin/env sh

curl http://reactphp:8000/provinces > /usr/local/apache2/htdocs/provinces.drift.html
curl http://reactphp-no-orm:8000/provinces > /usr/local/apache2/htdocs/provinces.drift-no-orm.html
curl http://webserver:80/provinces > /usr/local/apache2/htdocs/provinces.s5.html
curl http://node:80/provinces > /usr/local/apache2/htdocs/provinces.node.html
curl http://go:8080/provinces > /usr/local/apache2/htdocs/provinces.go.html

sleep 2
ab -g /usr/local/apache2/htdocs/drift.tsv -n 5000 -c 100 http://reactphp:8000/provinces > /usr/local/apache2/htdocs/drift.txt 2>&1
sleep 2
ab -g /usr/local/apache2/htdocs/drift-no-orm.tsv -n 5000 -c 100 http://reactphp-no-orm:8000/provinces > /usr/local/apache2/htdocs/drift-no-orm.txt 2>&1
sleep 15
ab -g /usr/local/apache2/htdocs/node.tsv -n 5000 -c 100 http://node:80/provinces > /usr/local/apache2/htdocs/node.txt 2>&1
sleep 15
ab -g /usr/local/apache2/htdocs/go.tsv -n 5000 -c 100 http://go:8080/provinces > /usr/local/apache2/htdocs/go.txt 2>&1
sleep 15
ab -g /usr/local/apache2/htdocs/s5.tsv -n 5000 -c 100 http://webserver:80/provinces > /usr/local/apache2/htdocs/s5.txt 2>&1

gnuplot drift.p
gnuplot drift-ttime.p
gnuplot drift-no-orm.p
gnuplot drift-no-orm-ttime.p
gnuplot s5.p
gnuplot s5-ttime.p
gnuplot node.p
gnuplot node-ttime.p
gnuplot go.p
gnuplot go-ttime.p
