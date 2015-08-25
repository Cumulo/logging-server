
var
  Immutable $ require :immutable

= exports.database $ Immutable.fromJS $ {}
  :isTravelling true
  :pointer -1
  :records (array)
  :initial (array)

= exports.state $ Immutable.fromJS $ {}
  :id null
  :role :user

= exports.store $ Immutable.List

= exports.task $ Immutable.fromJS $ {}
  :id null
  :text :
  :done false
