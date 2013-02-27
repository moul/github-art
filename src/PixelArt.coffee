fs = require 'fs'

class module.exports.PixelArt
  constructor: (@options = {}, fn = null) ->
    switch typeof(@options)
      when 'string'
        @options = path: @options
    if @options.path?
      @loadFile @options.path, (err, data) =>
        return fn err, data if err
        fn false, @
    else
      fn false, @
    return @

  loadFile: (filePath, fn = null) =>
    fs.readFile filePath, (err, buffer) =>
      return fn err, buffer if err and buffer
      @art = buffer.toString().split('\n')[0...7]
      fn err, @art if fn

  toString: => @art.join ''
  toArray: =>  @toString().split(//)
