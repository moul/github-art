{GhCalendarPixelArt} = require '../src/GhCalendarPixelArt'

opts = art: '../arts/moul.txt'
gh = new GhCalendarPixelArt opts, ->
  console.log gh.map
