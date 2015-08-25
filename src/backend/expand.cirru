
var
  Immutable $ require :immutable

var
  schema $ require :./schema
  updater $ require :./controller/updater

= module.exports $ \ (db state)
  cond (is (state.get :role) :user)
    cond (db.get :isTravelling)
      ... db
        get :records
        slice 0 $ db.get :pointer
        reduce
          \ (acc action)
            updater acc (action.get 0) (action.get 1)
          db.get :initial
      ... db
        get :records
        reduce
          \ (acc action)
            updater acc (action.get 0) (action.get 1)
          db.get :initial
    , db
