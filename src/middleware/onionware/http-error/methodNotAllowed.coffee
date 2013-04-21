log = require 'src/middleware/logger/log'

module.exports = (req, res, peel) ->

  res.status 405
  res.data.body.error = 'Method not allowed'
  res.view = 'pages/error/error'

  log.info 'ONION', res.data.body.error
  
  peel()