Registry  = require 'src/model/Registry'

module.exports = ->

  console.log 'Loading config: DEVELOPMENT'

  Registry.config = require('src/server/config').development

  # HTML not ugly
  @locals.pretty = true
  # @locals.debug = true;

  # This is an extension to methodOverride for development only
  @use (req, res, next) ->
    req.originalMethod = req.originalMethod || req.method
    if req.query._method?
      req.method = req.query._method.toUpperCase()
      req.body = req.query
      delete req.query._method
    next()

  @set 'MongoLogger', require 'src/lib/mongo/logger'