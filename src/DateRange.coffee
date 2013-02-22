cleanDate = (date) ->
  clean = new Date date
  clean.setSeconds 0
  clean.setMinutes 0
  clean.setHours   0
  return clean

getLastSunday = (date) ->
  sundayTimestamp = date.getTime() - date.getDay() * 86400 * 1000
  return new Date sundayTimestamp

removeWeeks = (date, weeks = 1) ->
  newDateTimestamp = date.getTime() - weeks * 7 * 86400 * 1000
  return new Date newDateTimestamp

removeDays = (date, days = 1) ->
  newDateTimestamp = date.getTime() - days * 86400 * 1000
  return new Date newDateTimestamp
addDays = (date, days = 1) -> removeDays date, -days

class DateRange
  constructor: (@options = {}) ->
    @now =                   @options.now || new Date()
    @length =                51 * 7
    @clean =                 cleanDate     @now
    @isCurrentWeekComplete = @now.getDay() is 6
    @currentLastSunday =     getLastSunday @now
    @first =                 removeWeeks   @currentLastSunday, 51 - @isCurrentWeekComplete
    @last =                  removeDays    @currentLastSunday, 1
    return @

  getDay: (i) => addDays @first, i
  toArray: =>    [@getDay i for i in [0...@length]][0]

module.exports =
  DateRange:     DateRange
  cleanDate:     cleanDate
  getLastSunday: getLastSunday
  removeWeeks:   removeWeeks
  removeDays:    removeDays
  addDays:       addDays
