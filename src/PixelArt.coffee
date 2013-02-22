fs = require 'fs'

class PixelArt
  constructor: (@options = {}) ->
    switch typeof(@options)
      when 'string'
        @loadFile @options
        @options = {}
    return @

  loadFile: (filePath, fn = null) =>
    fs.readFile filePath, (err, buffer) =>
      return fn err, buffer if err and buffer
      @art = buffer.toString().split('\n')[0...7]
      fn err, @art if fn

module.exports =
  PixelArt: PixelArt