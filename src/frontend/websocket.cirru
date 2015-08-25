
var
  Pipeline $ require :cumulo-pipeline
  Immutable $ require :immutable

= exports.in $ new Pipeline
= exports.out $ new Pipeline

= exports.setup $ \ (options)

  var socket $ new WebSocket $ + :ws:// location.host :: options.port

  = socket.onmessage $ \ (event)
    var data $ JSON.parse event.data
    exports.out.send $ Immutable.fromJS data

  exports.in.for $ \ (data)
    socket.send $ JSON.stringify data
