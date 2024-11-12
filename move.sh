
roottextdir=/data/data/com.termux/files/usr/share/apache2/default-site/suttacentral.net/sc-data/sc_bilara_data/root/pli/ms/sutta
audiodir=/data/data/com.termux/files/usr/share/apache2/default-site/htdocs/assets/audio
nikaya=sn
book=${nikaya}

function move {
cd $audiodir
mv /storage/emulated/0/Download/*ogg ./
ls *.ogg | awk -F'.' '{print "mkdir "substr($1,0,2)"/"$1" ; mv "$1"* "substr($1,0,2)"/"$1}' | sort -Vf | uniq > tmpmove
cat tmpmove 
echo "thus will be?"
read
bash tmpmove
}

for i in `cat tmpmove | awk -F'/' '{print $2}' | awk '{print $1}' | sort | uniq`
do 
./check.sh $i
done

exit 

19 22 51 47 46 45 44 43 40 37 36 35 33 28 21 20 

cd $roottextdir/
cd sn
for i in 19 22 51 47 46 45 44 43 40 
	openLinks
	read
	cd ../sn22
	openLinks
	read
	cd ../sn51
	openLinks
	read


	for i in sn56.{81..95}
	do
		termux-open-url https://voice.suttacentral.net/scv/index.html?#/sutta?search=$i
	done

	for i in `ls sn56.*-*_* | sed 's/_root.*//g'`
	do
		termux-open-url https://voice.suttacentral.net/scv/index.html?#/sutta?search=$i
	done


	book=`ls * | sed 's/\..*//g' `
	nikaya=`echo $book | sed 's/[0-9]*//g'`
	echo $nikaya/$book

