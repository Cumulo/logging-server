
var
  action $ require :./backend/action
  differ $ require :./backend/differ
  expand $ require :./backend/expand
  database $ require :./backend/database
  websocket $ require :./backend/websocket

websocket.setup $ {} (:port 4003)

differ.setup $ {} (:expand expand)

websocket.out.forward action.in
action.out.forward database.in
database.out.forward differ.in
differ.out.forward websocket.in

