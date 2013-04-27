module.exports = (error) ->

  return (req, res, peel) ->

    res.status 400
    res.data.body.error = 'Bad request: ' + (error.message || error)

    log.info 'ONION', res.data.body.error

    peel()