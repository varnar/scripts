#! /bin/bash
DIRECTORY_TO_OBSERVE="/root"
firebase=$1

BUILD_SCRIPT=/usercode/tree2json.py

mkdir -p /temp/
file="/temp/homedir.json"
#if [ ! -e "$file" ] ; then

  #touch "$file"
#fi
#always empty the file. If it has older dir structure, firebase never gets the i
nitial tree
echo "" > $file

function checkhomedir {
  homedir=$(python $BUILD_SCRIPT)
  diff=$(echo $homedir | diff /temp/homedir.json -)

  if [ "$diff" != "" ]
  then
    #echo "homedir changed"
    echo $homedir > $file
    echo $homedir | curl -X PUT -d @- $firebase
  fi
}

while :
do
  checkhomedir
  sleep 2
done
