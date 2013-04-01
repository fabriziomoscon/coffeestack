Registry = require 'src/model/Registry'

module.exports = ->

  console.log 'Loading config: TESTING'

  Registry.config = require('src/server/config').testing
  
  @set 'MongoLogger', require 'src/lib/mongo/logger'