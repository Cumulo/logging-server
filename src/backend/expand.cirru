
var
  Immutable $ require :immutable

var
  schema $ require :./schema

= module.exports $ \ (db state)
  cond (is (state.get :role) :user)
    ... db
      get :records
      reduce $ \ (acc action)
      get :initial