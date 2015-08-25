
var
  Immutable $ require :immutable

var
  updater $ require :./updater

= exports.commit $ \ (db actionType actionData)
  var newStore $ ... db
    getIn $ [] :recorder :records
    reduce
      \ (acc action)
        updater acc (action.get 0) (action.get 1)
      db.get :intial
  db.update :recorder $ \ (recorder)
    ... recorder
      set :records $ Immutable.List
      set :intial newStore
      set :isTravelling false

= exports.reset $ \ (db actionType actionData)
  db.update :recorder $ \ (recorder)
    ... recorder
      set :records $ Immutable.List
      set :pointer -1
      set :isTravelling false

= exports.peek $ \ (db actionType actionData)
  var position actionData
  db.update :recorder $ \ (recorder)
    ... recorder
      set :pointer actionData
      set :isTravelling true

= exports.discard $ \ (db actionType actionData)
  var position $ db.getIn $ [] :recorder :pointer
  db.update :recorder $ \ (recorder)
    ... recorder
      update :records $ \ (records)
        records.slice 0 $ + position 1

= exports.record $ \ (db actionType actionData)
  db.update :recorder $ \ (recorder)
    ... recorder
      update :records $ \ (records)
        records.push $ Immutable.List actionType actionData
