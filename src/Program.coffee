fs =          require 'fs'
program =     require 'commander'
{GithubArt} = require './GithubArt'

class module.exports.Program
  constructor: (@options = {}) ->
    return @

  run: =>
    console.log "Hello world"

  @create: (options = {}) ->
    new Program options

  @run: ->
    do (do Program.create).run
