
var
  Immutable $ require :immutable

var
  schema $ require :../schema

= exports.connect $ \ (db actionType actionData stateId)
  ... db
    setIn ([] :states stateId)
      schema.state.merge $ Immutable.Map $ {}
        :id stateId

= exports.disconnect $ \ (db actionType actionData stateId)
  ... db
    deleteIn ([] :states stateId)

= exports.role $ \ (db actionType actionData stateId)
  ... db
    updateIn ([] :states stateId) $ \ (aState)
      aState.update :role $ \ (role)
        cond (is role :user) :admin :user
