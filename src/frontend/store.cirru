
var
  Immutable $ require :immutable
  Pipeline $ require :cumulo-pipeline
  patch $ require :immutablepatch

= exports.in $ new Pipeline

var _store $ Immutable.Map

= exports.out $ exports.in.reduce _store $ \ (store diff)
  -- console.log :patching (store.toJS) (diff.toJS)
  var result $ patch store diff
  -- console.log :result (result.toJS)
  return result
