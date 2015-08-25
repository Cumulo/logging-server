
var
  React $ require :react
  Immutable $ require :immutable

var
  view $ require :../frontend/view

var
  Record $ React.createFactory $ require :./record

var
  div $ React.createFactory :div
  span $ React.createFactory :span

= module.exports $ React.createClass $ {}
  :displayName :recorder-controller

  :propTypes $ {}
    :recorder $ React.PropTypes.instanceOf Immutable.Map

  :onCommit $ \ ()
    view.action $ {}
      :type :actions-recorder/commit
      :data (object)

  :onReset $ \ ()
    view.action $ {}
      :type :actions-recorder/reset
      :data (object)

  :onDiscard $ \ ()
    view.action $ {}
      :type :actions-recorder/discard
      :data (object)

  :onSwitch $ \ ()
    view.action $ {}
      :type :actions-recorder/switch
      :data (object)

  :renderRecords $ \ ()
    ... this.props.recorder
      get :records
      map $ \\ (record index)
        Record $ {} (:key index) (:record record) (:index index)
          :isFocused $ and
            is
              this.props.recorder.get :pointer
              , index
            this.props.recorder.get :isTravelling

  :render $ \ ()
    div ({} (:className :app-controller))
      div ({} (:className ":controller-header line"))
        div
          {} (:onClick this.onCommit)
            :className ":button is-attract"
          , :Commit
        div
          {} (:onClick this.onSwitch)
            :className ":button is-attract"
          , :Switch
        div
          {} (:onClick this.onReset)
            :className ":button is-danger"
          , :Reset
        div
          {} (:onClick this.onDiscard)
            :className ":button is-danger"
          , :Discard
        span ({} (:className :controller-status))
          cond (this.props.recorder.get :isTravelling) :isTravelling undefined
      div ({} (:className :controller-table))
        this.renderRecords
