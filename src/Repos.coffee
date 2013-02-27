class module.exports.Repos
  constructor: (@opts = {}) ->
    @opts.bin ?= 'git'
    return @

  exec: (cmd = [], fn = null) =>
    console.log cmd
    fn false, {} if fn

  init: (fn = null) =>                     @exec [@opts.bin, 'init',   @opts.path],             fn
  add: (path = '.', fn = null) =>          @exec [@opts.bin, 'add',    path],                   fn
  commit: (logMessage = ".", fn = null) => @exec [@opts.bin, 'commit', '-a', '-m', logMessage], fn
