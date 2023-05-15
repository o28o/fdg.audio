roottextdir=/data/data/com.termux/files/usr/share/apache2/default-site/suttacentral.net/sc-data/sc_bilara_data/root/pli/ms/sutta
audiodir=/data/data/com.termux/files/usr/share/apache2/default-site/htdocs/assets/audio
#nikaya=sn
#book=${nikaya}$@

#book=`ls * | sed 's/\..*//g' `
book=$@
nikaya=`echo $book | sed 's/[0-9]*//g'`
	
	
function check {
  rm $audiodir/tmpcheck
	cd $audiodir/$nikaya/$book/
	for i in `ls $roottextdir/$nikaya/$book/* | sed 's/_root.*//g' | awk -F'/' '{print $NF}'` ; do  
		ls $i* 1>/dev/null
	done 2>&1 | awk -F"'" '{print $2}' | sed 's/*//g' | sort -Vf | while read line 
do
echo $line 
echo "termux-open-url https://voice.suttacentral.net/scv/index.html?#/sutta?search=$line" >> $audiodir/tmpcheck
done
echo "do you want to open missing links?"
read
bash $audiodir/tmpcheck
	cd - >/dev/null
}
check


