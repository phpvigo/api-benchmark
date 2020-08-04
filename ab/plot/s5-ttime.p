set terminal jpeg size 500,500
set size 1, 1
set output "/usr/local/apache2/htdocs/s5-ttime.png"
set title "Symfony5: Total time sorted. 5000 request, 100 concurrency"
set grid y
set xlabel "request"
set ylabel "response time (ms)"

plot "/usr/local/apache2/htdocs/s5.tsv" using 9 smooth sbezier with lines title "response time"