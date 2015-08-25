
var
  Immutable $ require :immutable

= exports.database $ Immutable.fromJS $ {}
  :recorder $ {}
    :isTravelling false
    :pointer -1
    :records (array)
    :initial (array)
  :states (object)

= exports.state $ Immutable.fromJS $ {}
  :id null
  :role :user

= exports.store $ Immutable.Map $ {}
  :role :user
  :store (array)

= exports.task $ Immutable.fromJS $ {}
  :id null
  :text :
  :done false
