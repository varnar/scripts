var Firebase = require("firebase")

if (process.argv[2]){
  var basePath = process.argv[2]
  var fbAlive = new Firebase(basePath + "/isAlive")
  fbAlive.set(Date.now())
  fbAlive.onDisconnect().remove()

  setInterval(()=>{
    fbAlive.set(Date.now())
  }, 10000)
}
else{
  console.log("isAlive::no firebase path found.")
}
