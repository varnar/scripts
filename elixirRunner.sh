#!/usr/bin/env sh


#The folder which we mount on docker is named the usercode.
#Move into the directory and execute the loop
cd /temp/
elixirc --ignore-module-conflict solution.ex

elixir -e "Solution.start" < inputFile
