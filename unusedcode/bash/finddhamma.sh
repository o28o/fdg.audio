find . -type f -name 'search-*.html' -mtime +2 -exec rm {} \;

#update hidden link 
last_char="${quote: -1}"

if [[ $last_char == *[.,:\!\;—–-…]* ]]; then
hreflastchar="<a target=_blank class=\"text-white text-decoration-none\" href=\"$linkgeneral#$anchor\">$last_char</a>"
else
hreflastchar="<a target=_blank class=\"text-white text-decoration-none\" href=\"$linkgeneral#$anchor\">&#8202;</a>"
fi  
quote=`echo $quote | sed 's@.$@'$hreflastchar'@g'`



/* localStorage.removeItem('successAlertDismissed');  
    
 document.addEventListener('DOMContentLoaded', function() {
    var successAlert = document.getElementById('successAlert');
    var alertDismissed = localStorage.getItem('successAlertDismissed');

    if (alertDismissed === 'true') {
      successAlert.style.display = 'none';
    }

    successAlert.querySelector('.btn-close').addEventListener('click', function() {
      successAlert.style.display = 'none';
      localStorage.setItem('successAlertDismissed', 'true');
    });
  });   
  
*/



#change from ru

#    tr=`nice -$nicevalue find $searchdir -name "*${np}-*"`
tr=`ls $searchdir/*${np}-* 2>/dev/null`
     thrulink=`echo $tr | sed 's@.*theravada.ru@'$linkforthru'@g'`
if [[ $filenameblock == *"dn"* ]]
then 
dnnumber=`echo $filenameblock | sed 's/dn//g'`
if [[ $mode == "offline" ]]
then 
thrulink="`ls -R $thsulocation/dn/ | grep -m1 \"dn${dnnumber}.html\" | awk -v lths="$linkforthsu" '{print lths\"/dn/\"$0}'`"
else 
thrulink=`grep -m1 "ДН $dnnumber " $thsucurldn | sed 's#href=\"/toc/translations/#href=\"https://tipitaka.theravada.su/node/table/#' |awk -F'"' '{print $2}'`
fi
  fi 
  `[[ "$thrulink" != "" ]] && echo "<a target=\"_blank\" href="$thrulink">Ru</a>"` 
`[[ "$thrulink" == "" ]] && [[ $link != "" ]] && echo "<a target=\"_blank\" href="$link">Ru</a>"`