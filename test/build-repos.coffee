{GhCalendarPixelArt} = require '../src/GhCalendarPixelArt'

# clear terminal
process.stdout.write '\u001B[2J\u001B[0;0f'

opts =
  art:
    path: "#{__dirname}/../arts/moul.txt"
  repos:
    path: '/tmp/tmp-repos'
    origin: 'git@github.com:moul/github-art.git'
    new:  true
  date: {}

gh = new GhCalendarPixelArt opts, ->
  console.log gh
  gh.create_repos (err, data) ->
    console.log err, data
