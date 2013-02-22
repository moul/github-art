{Repos} =     require '../src/Repos'
{PixelArt} =  require '../src/PixelArt'
{DateRange} = require '../src/DateRange'

pa = new PixelArt
pa.loadFile '../arts/moul.txt', (err, art) ->
  dr = new DateRange
  repos = new Repos pa, dr
  console.log repos.map()

