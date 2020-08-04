set terminal jpeg size 500,500
set size 1, 1
set output "/usr/local/apache2/htdocs/drift-ttime.png"
set title "DriftPHP: Total time sorted. 5000 request, 100 concurrency"
set grid y
set xlabel "request"
set ylabel "response time (ms)"

plot "/usr/local/apache2/htdocs/drift.tsv" using 9 smooth sbezier with lines title "response time"