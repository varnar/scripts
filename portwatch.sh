#! /bin/bash
PORTOPEN="false"
FIREBASEPORTPATH=$1
echo "port watching ";
echo $FIREBASEPORTPATH;

function markClosed {
  if [ "$PORTOPEN" == "true" ]; then
    echo 'PORT CLOSED'
    curl -X DELETE $FIREBASEPORTPATH
    PORTOPEN="false"
  fi
}

function markOpen {
  if [ "$PORTOPEN" == "false" ]; then
    echo 'PORT OPEN'
    curl -X PUT -d 'true' $FIREBASEPORTPATH
    PORTOPEN="true"
  fi
}

markClosed;

while :
do
  while ! nc -z -w5 127.0.0.1 80; do
    sleep 2;
    markClosed;
  done;
  markOpen;
  sleep 5;
done
