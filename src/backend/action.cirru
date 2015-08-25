
var
  shortid $ require :shortid
  Pipeline $ require :cumulo-pipeline
  Immutable $ require :immutable

= exports.in $ new Pipeline

= exports.out $ exports.in.map $ \ (action)
  case action.type
    :todo/add
      = action.data.id (shortid.generate)
      Immutable.fromJS action
    else
      Immutable.fromJS action
