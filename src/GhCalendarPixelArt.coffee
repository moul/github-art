{PixelArt} =  require './PixelArt'
{DateRange} = require './DateRange'
{Repos} =     require './Repos'

class module.exports.GhCalendarPixelArt
  constructor: (@opts = {}, fn = (->)) ->
    @opts.repos ?= {}
    @opts.art ?=   {}
    @opts.range ?= {}
    new PixelArt  @opts.art, (err, data) =>
      @pa = data
      return fn err, data if err
      new DateRange @opts.range, (err, data) =>
        @dr = data
        return fn err, data if err
        new Repos     @opts.repos, (err, data) =>
          @re = data
          return fn err, data if err
          @.__defineGetter__ 'map', @map
          fn false, {}
    return @

  run: (fn = (->)) =>
    @create_repos (err, data) =>
      return fn err, data if err
      fn false, {}

  create_repos: (fn = (->)) =>
    @todo = []
    for date, nbCommits of @map
      for i in [0...nbCommits]
        @todo.push
          date: date
    @re.init (err, data) =>
      return fn err, data if err
      @_create_repos_rec fn

  _create_repos_rec: (fn = (->)) =>
    unless @todo.length
      return fn false, {}
    next = @todo.shift()
    @re.createFile 'pony.txt', Math.random().toString(), (err, data) =>
      return fn err, data if err
      @re.add 'pony.txt', (err, data) =>
        return fn err, data if err
        opts =
          date:    next.date
          message: 'pony pony pony'
        @re.commit opts, (err, data) =>
          return fn err, data if err
          @_create_repos_rec fn

  map: =>
    return @_map if @_map
    paArr = @pa.toArray()
    drArr = @dr.toArray()
    @_map = {}
    for i in [0...@dr.length]
      @_map[Math.floor(drArr[i].getTime() / 1000)] = paArr[i]
    return @_map
