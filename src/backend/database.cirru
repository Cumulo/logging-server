
var
  Pipeline $ require :cumulo-pipeline

var
  schema $ require :./schema
  recorderController $ require :./controller/recorder

= exports.in $ new Pipeline

var _database schema.database

= exports.out $ exports.in.reduce _database $ \ (db action)
  var
    ([]~ groupName eventName) $ ... action
      get :type
      split :/
  cond (is groupName :actions-recorder)
    case eventName
      :commit
        recorderController.commit db (action.get :data)
      :reset
        recorderController.reset db (action.get :data)
      :peek
        recorderController.peek db (action.get :data)
      :discard
        recorderController.discard db (action.get :data)
      else
        console.warn $ + ":Unknown action: " (actions.get :type)
        , db
    recorderController.record db (action.get :data)
