mv /storage/emulated/0/Download/*ogg ./
ls *.ogg | awk -F'.' '{print "mkdir "substr($1,0,2)"/"$1" && mv "$1"* "substr($1,0,2)"/"$1}' > tmp
bash tmp

#for i in {1..152} ; do  ls mn/mn$i*; done
#du -h mn
#commit_and_push
