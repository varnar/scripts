#!/usr/bin/env sh


#The folder which we mount on docker is named the usercode.
#Move into the directory and execute the loop
cd /temp/
~/.sdkman/candidates/kotlin/current/bin/kotlinc file.kt -include-runtime -d file
.jar && java -jar file.jar
