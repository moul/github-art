{call, system} = require './utils'

class module.exports.Repos
  constructor: (@opts = {}, fn = null) ->
    @opts.bin ?= 'git'
    fn false, @ if fn
    return @

  createFile: (filename, content = '', fn = null) =>
    console.log 'createFile', filename, content
    fn false, {} if fn

  exec: (cmd = [], fn = null) =>
    console.log cmd
    fn false, {} if fn

  init: (fn = null) =>                     @exec [@opts.bin, 'init',   @opts.path],             fn
  add: (path = '.', fn = null) =>          @exec [@opts.bin, 'add',    path],                   fn

  commit: (opts = {}, fn = null) =>
    opts.message ?= '.'
    opts.date ?= new Date
    @exec [@opts.bin, 'commit', '-a', '-m', opts.message, '--date', opts.date], fn
