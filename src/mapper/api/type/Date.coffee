check = require 'check-types'

class DateMapper


  @marshall: (date) ->

    throw new Error 'Invalid date' unless date instanceof Date
    
    return date.getTime()


  @unmarshall: (timestamp) ->

    throw new Error 'Invalid timestamp' unless check.isNumber timestamp

    return new Date timestamp


module.exports = DateMapper