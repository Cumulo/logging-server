
var
  Pipeline $ require :cumulo-pipeline
  Immutable $ require :immutable

var
  schema $ require :./schema
  stateController $ require :./controller/state
  recorderController $ require :./controller/recorder

= exports.in $ new Pipeline

var _database schema.database

= exports.out $ exports.in.reduce _database $ \ (db action)
  var
    actionType $ action.get :type
    actionData $ Immutable.fromJS $ action.get :data
    stateId $ action.get :stateId
    ([]~ groupName eventName) $ ... action
      get :type
      split :/
  case groupName
    :actions-recorder $ case eventName
      :commit
        recorderController.commit db actionType actionData
      :reset
        recorderController.reset db actionType actionData
      :peek
        recorderController.peek db actionType actionData
      :discard
        recorderController.discard db actionType actionData
      :switch
        recorderController.switch db actionType actionData
      else
        console.warn $ + ":Unknown action: " actionType
        , db
    :state $ case eventName
      :connect
        stateController.connect db actionType actionData stateId
      :disconnect
        stateController.disconnect db actionType actionData stateId
      :role
        stateController.role db actionType actionData stateId
      else
        console.warn $ + ":Unknown action: " actionType
        , db
    else
      recorderController.record db actionType actionData
