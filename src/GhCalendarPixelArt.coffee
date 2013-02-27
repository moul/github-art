{PixelArt} =  require './PixelArt'
{DateRange} = require './DateRange'
{Repos} =     require './Repos'

class module.exports.GhCalendarPixelArt
  constructor: (@opts = {}, fn = (->)) ->
    @opts.repos ?= {}
    @opts.art ?=   {}
    @opts.range ?= {}
    new PixelArt  @opts.art, (err, data) =>
      @pa = data
      return fn err, data if err
      new DateRange @opts.range, (err, data) =>
        @dr = data
        return fn err, data if err
        new Repos     @opts.repos, (err, data) =>
          @re = data
          return fn err, data if err
          @.__defineGetter__ 'map', @map
          fn false, {}
    return @

  map: =>
    return @_map if @_map
    paArr = @pa.toArray()
    drArr = @dr.toArray()
    @_map = {}
    for i in [0...@dr.length]
      @_map[drArr[i].getTime()] = paArr[i]
    return @_map

###
pa = new PixelArt
pa.loadFile '../arts/moul.txt', (err, art) ->
  dr = new DateRange
  repos = new Repos pa, dr
  console.log repos.map()
###