{PixelArt} =  require '../src/PixelArt'
{DateRange} = require '../src/DateRange'

class Repos
  constructor: (@PixelArt, @DateRange) ->
    return @

  map: =>
    paArr = @PixelArt.toArray()
    drArr = @DateRange.toArray()
    @map = {}
    for i in [0...@DateRange.length]
      @map[drArr[i].getTime()] = paArr[i]
    return @map

module.exports =
  Repos: Repos
