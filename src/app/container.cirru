
var
  React $ require :react
  Immutable $ require :immutable

var
  view $ require :../frontend/view

var
  Todolist $ React.createFactory $ require :./todolist
  Controller $ React.createFactory $ require :../panel/controller

var
  div $ React.createFactory :div
  span $ React.createFactory :span

= module.exports $ React.createClass $ {}
  :displayName :app-container

  :propTypes $ {}
    :store $ React.PropTypes.instanceOf Immutable.Map

  :onRoleSwitch $ \ ()
    view.action $ {}
      :type :state/role
      :data (object)

  :render $ \ ()
    div ({} (:className :app-container))
      div ({} (:className ":container-header line"))
        div
          {} (:className ":app-switcher button is-minor")
            :onClick this.onRoleSwitch
          , ":Switch Role"
        span ({} (:className :container-role))
          this.props.store.get :role
      div ({} (:className :container-body))
        cond (is (this.props.store.get :role) :user)
          Todolist $ {} (:tasks $ this.props.store.get :store)
          Controller $ {} (:recorder $ this.props.store.get :store)

