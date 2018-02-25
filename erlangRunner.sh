#!/usr/bin/env sh


#The folder which we mount on docker is named the usercode.
#Move into the directory and execute the loop
cd /temp/
erlc solution.erl

erl -noshell -s solution start -s init stop
