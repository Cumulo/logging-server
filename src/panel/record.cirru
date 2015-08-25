
var
  React $ require :react
  Immutable $ require :immutable
  classnames $ require :classnames

var
  view $ require :../frontend/view

var
  div $ React.createFactory :div
  pre $ React.createFactory :pre

= module.exports $ React.createClass $ {}
  :displayName :recorder-record

  :propTypes $ {}
    :record $ React.PropTypes.instanceOf Immutable.List
    :index React.PropTypes.number.isRequired
    :isFocused React.PropTypes.bool.isRequired

  :onPeek $ \ ()
    view.action $ {}
      :type :actions-recorder/peek
      :data this.props.index

  :render $ \ ()
    var className $ classnames :app-record $ {}
      :is-focused this.props.isFocused

    div ({} (:className className) (:onClick this.onPeek))
      div ({} (:className :record-type))
        this.props.record.get 0
      pre ({} (:className :record-data))
        JSON.stringify
          this.props.record.get 1
