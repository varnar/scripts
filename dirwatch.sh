#! /bin/bash
DIRECTORY_TO_OBSERVE="/root"
firebase=$1

cp /usercode/uploads/* /root
function block_for_change {
  inotifywait -r \
    --exclude '.*/\..*' \
    -e modify,move,create,delete,delete_self,close \
    $DIRECTORY_TO_OBSERVE
}
BUILD_SCRIPT=/usercode/tree2json.py
function build {
  sleep 1
  python $BUILD_SCRIPT | curl -X PUT -d @- $firebase
}
build
#while block_for_change; do
while block_for_change; do
  build
done
