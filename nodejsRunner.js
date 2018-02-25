#!/usr/bin/env sh


#The folder which we mount on docker is named the usercode.
#Move into the directory and execute the loop
cd /temp/
~/.sdkman/candidates/kotlin/current/bin/kotlinc file.kt -include-runtime -d file
.jar && java -jar file.jar
root@machine:/usercode# cat nodejsRunner.js
var fs = require('fs')
var vm = require('vm')

var file = process.argv[2]
var code = fs.readFileSync(file, 'utf8')

var context = {}
for (var p in global) {
  context[p] = global[p]
}
context.require = require

require('domain')
  .create()
  .on('error', (error) => {
    console.error(error.stack)
  })
  .run(() => {
    process.nextTick(function () {
      vm.runInNewContext('"use strict";\n' + code, context, {
        filename: file,
        lineOffset: -1
      })
    })
  })
