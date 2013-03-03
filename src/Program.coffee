fs =          require 'fs'
program =     require 'commander'
{GithubArt} = require './GithubArt'

class module.exports.Program
  constructor: (@options = {}) ->
    @options.name ?= 'github-art'
    do @initCommander
    return @

  initCommander: =>
    program.name = @options.name
    program
      .version(do Program.getVersion)
      .usage('--repos=git@github.com:user/github-art-data.git --art=/path/to/art.txt --path=/tmp/repos/')
      .option('-v, --verbose',       'verbose output')
      .option('-o, --override',      'erase local repos if exists')
      .option('-f, --force',         'force push')
      .option('-r, --repos <repos>', 'github repos url')
      .option('-p, --path <path>',   'local git directory')
      .option('-a, --art <art>',     'file containing github art (txt, 51x7)')

  parseOptions: (fn = null) =>
    program.parse process.argv
    @options[key] = program[key] for key in ['art', 'repos', 'path', 'override', 'force', 'override', 'verbose']
    if typeof(@options.art) is 'string'
      @options.art =
        path:   @options.art
    if typeof(@options.repos) is 'string'
      @options.repos =
        path:   @options.path
        origin: @options.repos
        new:    @options.repos
    @options.date = {}
    fn false if fn

  run: (fn = null) =>
    @parseOptions =>
      console.log @options
      new GithubArt @options, (err, ga) =>
        @ga = ga
        @ga.create_repos (err, data) =>
          console.log err, data
    #      @ga.push (err, data) =>
    #        console.log err, data

  @getVersion: ->
    JSON.parse(fs.readFileSync "#{__dirname}/../package.json", 'utf8').version

  @create: (options = {}) ->
    new Program options

  @run: (fn = null) ->
    (do Program.create).run fn
