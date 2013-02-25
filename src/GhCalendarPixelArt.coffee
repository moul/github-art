{PixelArt} =  require './PixelArt'
{DateRange} = require './DateRange'
{Repos} =     require './Repos'

class module.exports.GhCalendarPixelArt
  constructor: (@opts = {}, fn) ->
    @pa = new PixelArt
    @dr = new DateRange
    @.__defineGetter__ 'map', @map
    @pa.loadFile @opts.art, fn
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
{Repos} =     require '../src/Repos'
{PixelArt} =  require '../src/PixelArt'
{DateRange} = require '../src/DateRange'

pa = new PixelArt
pa.loadFile '../arts/moul.txt', (err, art) ->
  dr = new DateRange
  repos = new Repos pa, dr
  console.log repos.map()
###