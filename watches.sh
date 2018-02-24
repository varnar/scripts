#! /bin/bash
FIREBASEDIRPATH=$1;
FIREBASEDIRPATH+="home_directory.json";

FIREBASEPORTPATH=$1
FIREBASEPORTPATH+="port.json";

#cp /usercode/uploads/* /root

#some housekeeping
echo -e "cd ~/\nPS1='\w\$ '" >> ~/.bashrc

echo "dir watching ";
echo $FIREBASEDIRPATH;

echo "port watching ";
echo $FIREBASEPORTPATH;
exec /usercode/portwatch.sh $FIREBASEPORTPATH&
exec /usercode/dirwatch_loop.sh $FIREBASEDIRPATH&

/bin/bash
