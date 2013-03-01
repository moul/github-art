{call, system} = require './utils'
pth = require 'path'
fs = require 'fs'

class module.exports.Repos
  constructor: (@opts = {}, fn = null) ->
    @opts.bin ?= 'git'
    fn false, @ if fn
    return @

  createFile: (filename, content = '', fn = null) =>
    #console.log 'createFile', filename, content
    fs.writeFile filename, content, 'utf-8', fn

  exec: (cmd = [], fn = null) =>
    call cmd[0], cmd[1...], fn

  init: (fn = null) =>
    if @opts.new
      @exec ['rm', '-rf', pth.join(@opts.path, '.git')], (err, stdout, stderr) =>
        return fn err, stdout, stderr if err
        @_init @opts.path, fn
    else
      @_init @opts.path, fn

  _init: (path, fn = null) =>
    @exec [@opts.bin, 'init', path], (err, stdout, stderr) =>
      return fn err, stdout, stderr if err
      if @opts.origin
        @_setupRemote 'origin', @opts.origin, fn
      else
        fn err, stdout, stderr

  _setupRemote: (name, url, fn = null) =>
    @exec [@opts.bin, 'remote', 'add', name, url], fn

  add: (path = '.', fn = null) =>
    @exec [@opts.bin, 'add', pth.join @opts.path, path], fn

  commit: (opts = {}, fn = null) =>
    opts.message ?= '.'
    opts.date ?= new Date
    @exec [@opts.bin, 'commit', '-m', opts.message, '--date', opts.date], fn
