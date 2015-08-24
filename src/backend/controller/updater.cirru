
var
  todo $ require :./todo

= module.exports $ \ (db actionType actionData)
  case actionType
    :todo/add $ todo.add db actionData
    :todo/update $ todo.update db actionData
    :todo/toggle $ todo.toggle db actionData
    :todo/remove $ todo.remove db actionData
    else
      console.log ":Unknown action: " actionType
      , db
