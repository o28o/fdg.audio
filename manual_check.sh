sutta 
cd an
for i in `find . -name "*.json" -type f | awk -F'/' '{print $NF }' | awk -F'_' '{print $1 }'`; do echo ${i}_ ; done > /data/data/com.termux/files/usr/share/apache2/default-site/htdocs/assets/audio/an/sutta.out

cd /data/data/com.termux/files/usr/share/apache2/default-site/htdocs/assets/audio/an
for i in `find . -name "an*" -type f | awk -F'/' '{print $NF }' | awk -F'_' '{print $1 }'`; do echo ${i}_ ; done > audio.out

cat sutta.out audio.out | sort -V | uniq -c | less | sort | awk '{print $1, $2}' | grep "^1" | awk '{print $2}' >missing.out 
less missing.out  


