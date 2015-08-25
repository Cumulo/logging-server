
var
  React $ require :react
  Immutable $ require :immutable
  classnames $ require :classnames

var
  view $ require :../frontend/view

var
  div $ React.createFactory :div
  input $ React.createFactory :input

= module.exports $ React.createClass $ {}
  :displayName :app-todolist

  :propTypes $ {}
    :task $ React.PropTypes.instanceOf Immutable.Map

  :onToggle $ \ ()
    view.action $ {}
      :type :todo/toggle
      :data $ {}

  :onUpdate $ \ (event)
    view.action $ {}
      :type :todo/update
      :data $ {}

  :onRemove $ \ ()
    view.action $ {}
      :type :todo/remove
      :data $ {}

  :render $ \ ()
    var toggleClass $ classnames :task-toggle $ {}
      :is-done $ this.props.get :done

    div ({} (:className :app-task))
      div ({} (:className toggleClass) (:onClick this.onToggle))
      input $ {} (:className :task-input) (:value $ this.props.get :text)
        :onChange this.onUpdate
      div
        {} (:className ":task-remove button is-danger") (:onClick this.onRemove)
        , :Remove
