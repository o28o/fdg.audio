
folder=an
cd /data/data/com.termux/files/usr/share/apache2/default-site/htdocs/suttacentral.net/sc-data/sc_bilara_data/root/pli/ms/sutta 
cd ${folder}
for i in `find . -name "*.json" -type f | awk -F'/' '{print $NF }' | awk -F'_' '{print $1 }'`; do echo ${i}_ ; done > /data/data/com.termux/files/usr/share/apache2/default-site/htdocs/assets/audio/sutta.out

cd /data/data/com.termux/files/usr/share/apache2/default-site/htdocs/assets/audio/${folder}
for i in `find . -name "${folder}*" -type f | awk -F'/' '{print $NF }' | awk -F'_' '{print $1 }'`; do echo ${i}_ ; done > ../audio.out

cd ..
cat sutta.out audio.out | sort -V | uniq -c | less | sort | awk '{print $1, $2}' | grep "^1" | awk '{print $2}' > missing.out 
less missing.out  

exit 0
rm *.out
sed -i 's@_@@g' missing.out
cat missing.out | while read line; do termux-open-url https://voice.suttacentral.net/scv/index.html?#/sutta?search=$line
done
