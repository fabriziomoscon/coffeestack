http = require 'src/controller/helper/httpResponse'

class Controller

# ----------

  @single: (req, res, next) ->

    if not /^[0-9A-F]{24}$/i.test req.params.id
      return res.onion.use( http.badRequest(new Error 'Invalid user id') ).peel()

    res.status 200
    res.data.body.user = {}
    return res.onion.peel()

# ----------

  @index: (req, res, next) ->

    res.status 200
    res.data.body.users = {}
    return res.onion.peel()

module.exports = Controller