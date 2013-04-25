log = require 'src/middleware/logger/log'

module.exports = (req, res, peel) ->

  res.status 401
  res.data.body.error = 'Unauthorized: Please sign in to continue'
  res.view = 'pages/auth/unauthorized'

  log.info 'ONION', res.data.body.error

  peel()