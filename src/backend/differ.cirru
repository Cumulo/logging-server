
var
  diff $ require :immutablediff
  Pipeline $ require :cumulo-pipeline
  Immutable $ require :immutable

= exports.in $ new Pipeline
= exports.out $ new Pipeline

var expand
= exports.setup $ \ (options)
  = expand options.expand

var _cache $ Immutable.fromJS $ {}

exports.in.for $ \ (db)
  ... db (getIn $ [] :states) $ forEach $ \ (aState)
    var theCache $ or
      _cache.get (aState.get :id)
      Immutable.Map
    var
      contextChanged $ isnt
        theCache.getIn $ [] :db :context
        db.get :context
      stateChanged $ isnt (theCache.get :state) aState
    if (or contextChanged stateChanged)
      do
        var newStore $ expand db aState
        var oldStore $ or
          theCache.get :store
          Immutable.Map
        exports.out.send $ {}
          :id $ aState.get :id
          :diff $ diff oldStore newStore
        = _cache $ _cache.set (aState.get :id) $ ... theCache
          set :db db
          set :state aState
          set :store newStore
    return true
