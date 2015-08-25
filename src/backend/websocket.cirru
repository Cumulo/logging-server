
var
  ws $ require :ws
  shortid $ require :shortid
  Pipeline $ require :cumulo-pipeline

= exports.in $ new Pipeline
= exports.out $ new Pipeline

var registry (object)

var connectHandler $ \ (socket)
  var id (shortid.generate)
  = (. registry id) socket

  socket.on :close $ \ ()
    exports.out.send $ {}
      :type :state/disconnect
      :stateId id

  socket.on :message $ \ (rawData)
    var action $ JSON.parse rawData
    = action.stateId id
    exports.out.send action

  exports.out.send $ {}
    :type :state/connect
    :stateId id

= exports.setup $ \ (options)
  var wss $ new ws.Server $ {} (:port options.port)
  wss.on :connection connectHandler
  console.log ":ws server listening at" options.port

exports.in.for $ \ (op)
  var socket $ . registry op.id
  if (? socket)
    do $ socket.send $ JSON.stringify op.diff
    dof $ console.warn ":missing socket" op
  return
