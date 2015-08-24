
var
  Pipeline $ require :cumulo-pipeline

var
  schema $ require :./schema
  recorderController $ require :./controller/recorder

= exports.in $ new Pipeline

var _database schema.database

= exports.out $ exports.in.reduce _database $ \ (db action)
  var
    ([]~ groupName eventName) $ action.type.split :/
  cond (is groupName :actions-recorder)
    case eventName
      :commit
        recorderController.commit db action
      :reset
        recorderController.reset db action
      :peek
        recorderController.peek db action
      :discard
        recorderController.discard db action
      else
        console.warn $ + ":Unknown action: " actions.type
        , db
    recorderController.record db action
