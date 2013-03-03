{GithubArt} = require '../lib/GithubArt'

# clear terminal
process.stdout.write '\u001B[2J\u001B[0;0f'

opts =
  art:
    path: "#{__dirname}/../arts/rainbow-4.txt"
  repos:
    path: '/tmp/tmp-repos'
    origin: 'git@github.com:moul/github-art-data.git'
    new:  true
  date: {}

gh = new GithubArt opts, ->
  console.log gh
  gh.create_repos (err, data) ->
    console.log err, data
    gh.push (err, data) ->
      console.log err, data
