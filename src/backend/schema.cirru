
var
  Immutable $ require :immutable

= exports.database $ Immutable.fromJS $ {}
  :recorder $ {}
    :isTravelling true
    :pointer -1
    :records (array)
    :initial (array)
  :states (object)

= exports.state $ Immutable.fromJS $ {}
  :id null
  :role :user

= exports.store $ Immutable.List

= exports.task $ Immutable.fromJS $ {}
  :id null
  :text :
  :done false
