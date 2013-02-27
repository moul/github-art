{GhCalendarPixelArt} = require '../src/GhCalendarPixelArt'

opts =
  art:
    path: '../arts/moul.txt'
  repos:
    path: '/tmp/tmp-repos'
    new:  true
  date: {}

gh = new GhCalendarPixelArt opts, ->
  console.log gh
