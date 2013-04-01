Registry = require 'src/model/Registry'

module.exports = ->

  console.log 'Loading config: PRODUCTION'

  Registry.config = require('src/server/config').production