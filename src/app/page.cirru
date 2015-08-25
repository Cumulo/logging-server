
var
  React $ require :react
  Pipeline $ require :cumulo-pipeline

var
  view $ require :../frontend/view
  store $ require :../frontend/store
  schema $ require :../backend/schema

var
  Container $ React.createFactory $ require :./container

var
  div $ React.createFactory :div

= exports.in $ new Pipeline

React.render
  Container $ {} (:store schema.store)
  , document.body

exports.in.for $ \ (store)
  React.render
    Container $ {} (:store store)
    , document.body
