
var
  React $ require :react
  Pipeline $ require :cumulo-pipeline

var
  view $ require :./frontend/view
  schema $ require :../backbone/schema

= exports.in $ new Pipeline

var
  div $ React.createFactory :div

var pageComponent $ React.createClass $ {}
  :displayName :app-page

  :render $ \ ()
    div null :demo

var Page $ React.createFactory pageComponent

React.render (Page) document.body
