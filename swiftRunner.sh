#!/usr/bin/env sh


#The folder which we mount on docker is named the usercode.
#Move into the directory and execute the loop
cd /temp/swift/Sources
#swift package init --type executable
#swift build >/dev/null
swiftc ./main.swift
