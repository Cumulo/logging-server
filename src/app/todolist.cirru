
var
  React $ require :react
  Immutable $ require :immutable

var
  view $ require :../frontend/view

var
  Task $ React.createFactory $ require :./task

var
  div $ React.createFactory :div

= module.exports $ React.createClass $ {}
  :displayName :app-todolist

  :propTypes $ {}
    :tasks $ React.PropTypes.instanceOf Immutable.List

  :onAdd $ \ ()
    view.action $ {}
      :type :todo/add
      :data $ {}

  :renderTasks $ \ ()
    this.props.tasks.map $ \ (task)
      Task $ {} (:key $ task.get :id) (:task task)

  :render $ \ ()
    div ({} (:className :app-todolist))
      div ({} (:className ":todolist-header line"))
        div
          {} (:className ":button is-attract") (:onClick this.onAdd)
          , :Add
      div ({} (:className :todolist-table))
        this.renderTasks
