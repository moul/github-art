#!/usr/bin/env coffee

{PixelArt} = require '../src/PixelArt'

pa = new PixelArt
pa.loadFile '../arts/moul.txt', (err, art) ->
  console.log pa.art
