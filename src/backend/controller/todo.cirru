
= exports.add $ \ (store actionData)
  var newTask actionData
  store.push newTask

= exports.update $ \ (store actionData)
  var
    id $ actionData.get :id
    text $ actionData.get :text
  store.map $ \ (task)
    cond (is (task.get :id) id)
      task.set :text text
      , task

= exports.toggle $ \ (store actionData)
  var id actionData
  store.map $ \ (task)
    cond (is (task.get :id) id)
      task.update :done $ \ (done)
        not done
      , task

= exports.remove $ \ (store actionData)
  var id actionData
  store.filterNot $ \ (task)
    is (task.get :id) id
