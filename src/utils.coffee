{spawn, exec} = require 'child_process'

module.exports.call = (command, args = [], fn = null) ->
  exec "#{command} #{args.join(' ')}", (err, stdout, stderr) ->
  if err?
    console.error "Error :"
    return console.dir   err
  fn err if fn

module.exports.system = (command, args) ->
  spawn command, args, stdio: "inherit"
