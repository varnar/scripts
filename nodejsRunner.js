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
