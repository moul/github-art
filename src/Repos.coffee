class module.exports.Repos
  constructor: (@opts = {}, fn = null) ->
    @opts.bin ?= 'git'
    fn false, @ if fn
    return @

  exec: (cmd = [], fn = null) =>
    console.log cmd
    fn false, {} if fn

  init: (fn = null) =>                     @exec [@opts.bin, 'init',   @opts.path],             fn
  add: (path = '.', fn = null) =>          @exec [@opts.bin, 'add',    path],                   fn
  commit: (logMessage = ".", fn = null) => @exec [@opts.bin, 'commit', '-a', '-m', logMessage], fn
