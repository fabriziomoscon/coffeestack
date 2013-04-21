log = require 'src/middleware/logger/log'

module.exports = ->

  log.info 'Loading config: TESTING'
  
  @set 'MongoLogger', require('src/lib/mongo/logger')(log)