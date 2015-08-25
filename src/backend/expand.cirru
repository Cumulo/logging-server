
var
  Immutable $ require :immutable

var
  updater $ require :./controller/updater

= module.exports $ \ (db state)
  var
    recorder $ db.get :recorder
    initial $ recorder.get :initial
    records $ recorder.get :records
  Immutable.Map $ {}
    :role (state.get :role)
    :store $ cond (is (state.get :role) :user)
      cond (recorder.get :isTravelling)
        ... records
          slice 0 $ + (recorder.get :pointer) 1
          reduce
            \ (acc action)
              updater acc (action.get 0) (action.get 1)
            , initial
        ... records
          reduce
            \ (acc action)
              updater acc (action.get 0) (action.get 1)
            , initial
      , recorder
