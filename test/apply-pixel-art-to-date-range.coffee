#!/usr/bin/env coffee

{PixelArt} =  require '../src/PixelArt'
{DateRange} = require '../src/DateRange'

pa = new PixelArt
pa.loadFile '../arts/moul.txt', (err, art) ->
  dr = new DateRange
  drArr = dr.toArray()
  paArr = pa.toArray()
  map = {}
  for i in [0...dr.length]
    map[drArr[i].getTime()] = paArr[i]
  console.log map
