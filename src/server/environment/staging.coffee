Registry = require 'src/model/Registry'

module.exports = ->

  console.log 'Loading config: STAGING'

  Registry.config = require('src/server/config').staging