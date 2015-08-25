
var
  Pipeline $ require :cumulo-pipeline

var
  page $ require :./app/page
  view $ require :./frontend/view
  store $ require :./frontend/store
  websocket $ require :./frontend/websocket

require :origami-ui
require :../style/main.css

websocket.out.for $ \ (data)
  console.info :websocket.out $ JSON.stringify (data.toJS)

store.out.for $ \ (data)
  console.info :store.out $ JSON.stringify (data.toJS)

websocket.out.forward store.in
store.out.forward page.in
view.out.forward websocket.in

websocket.setup $ {} (:port 4003)
