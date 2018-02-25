#!/usr/bin/env sh

alias pash='mono /pash/Source/PashConsole/bin/Debug/Pash.exe'
#The folder which we mount on docker is named the usercode.
#Move into the directory and execute the loop
cd /temp/
pash script.ps1
