{spawn, exec} = require 'child_process'

module.exports.call = (command, args = [], fn = null) ->
  cmdline = []
  cmdline.push "\"#{command}\""
  for arg in args
    cmdline.push "\"#{arg}\""
  console.log cmdline.join ' '
  exec cmdline.join(' '), (err, stdout, stderr) ->
    if err?
      console.error "Error :"
      return console.dir err
    fn err, stdout, stderr  if fn

module.exports.system = (command, args) ->
  spawn command, args, stdio: "inherit"
