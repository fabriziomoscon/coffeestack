log = require 'src/middleware/logger/log'

module.exports = (error) ->

  return (req, res, peel) ->

    res.status 500
    res.data.body.error = 'Server error: ' + (error.message || error)
    res.view = 'pages/error/error'
    
    log.info 'ONION', res.data.body.error
    
    peel()