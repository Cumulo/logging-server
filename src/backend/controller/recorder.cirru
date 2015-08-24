
var
  Immutable $ require :immutable

var
  updater $ require :./updater

= exports.commit $ \ (db actionData)
  var newStore $ ... db
    get :records
    reduce
      \ (acc action)
        updater acc (action.get 0) (action.get 1)
      db.get :intial
  ... db
    set :records $ Immutable.List
    set :intial newStore

= exports.reset $ \ (db actionData)
  ... db
    set :records $ Immutable.List
    set :pointer -1

= exports.peek $ \ (db actionData)
  var position actionData
  ... db
    set :pointer actionData

= exports.discard $ \ (db action)
  var position $ db.get :pointer
  ... db
    update :records $ \ (records)
      records.slice 0 $ + position 1

= exports.record $ \ (db action)
  var
    actionType action.type
    actionData $ Immutable.fromJS action.data
  ... db
    update :records $ \ (records)
      records.push $ Immutable.List actionType actionData
