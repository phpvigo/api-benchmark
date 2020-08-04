#!/usr/bin/env sh

curl http://reactphp:8000/provinces > html/provinces.drift.html
curl http://webserver:80/provinces > html/provinces.s5.html

sleep 2

echo "GET http://reactphp:8000/provinces" | ./vegeta attack -name=drift -rate=500 -duration=10s > drift.bin
sleep 15
echo "GET http://webserver:80/provinces" | ./vegeta attack -name=s5 -rate=500 -duration=10s > s5.bin

./vegeta report drift.bin > html/drift.txt
./vegeta report s5.bin > html/s5.txt

cat drift.bin | ./vegeta plot > html/drift.html
cat s5.bin | ./vegeta plot > html/s5.html

./vegeta plot drift.bin s5.bin > html/resume.html