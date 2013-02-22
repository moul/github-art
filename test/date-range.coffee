#!/usr/bin/env coffee

{DateRange} = require '../src/DateRange'

dr = new DateRange {}

for key in ['now', 'clean', 'isCurrentWeekComplete', 'currentLastSunday', 'first', 'last']
  console.log "#{key} = #{dr[key]}"

console.log dr.toArray()