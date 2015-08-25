
var
  React $ require :react

var
  Recorder $ React.createFactory $ require :./record

var
  div $ React.createFactory :div

= module.exports $ React.createClass $ {}
  :displayName :recorder-controller

  :render $ \ ()
    div null ":this is a recorder-controller"
