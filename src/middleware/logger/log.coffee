Logger = require 'bunyan'

log = new Logger {
  name: 'coffeestack'
  streams: [
    {
      path: 'coffeestack.fatal.log'
      level: 'fatal' 
    }
    {
      path: 'coffeestack.err.log'
      level: 'error'
    }
    {
      type: 'rotating-file'
      path: 'coffeestack.warn.log'
      period: '1d',    # daily rotation
      count: 10        # keep 3 back copies
      level: 'warn'
    }
    {
      path: 'coffeestack.info.log' 
      level: 'info'
    }
    {
      stream: process.stdout
      level: 'debug'
    }
    {
      path: 'coffeestack.trace.log'
      level: 'trace'
    }
  ]
  serializers: Logger.stdSerializers
  # src: true
}

module.exports = log