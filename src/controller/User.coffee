http = require 'src/controller/helper/httpResponse'

isValidObjectId = require 'src/validator/type/ObjectId'

class Controller

# ----------

  @index: (req, res, next) ->

    res.status 200
    res.data.body.users = {}
    return res.onion.peel()

# ----------

  @single: (req, res, next) ->

    unless isValidObjectId req.params.id
      return res.onion.use( http.badRequest(new Error 'Invalid user id') ).peel()

    res.status 200
    res.data.body.user = {}
    return res.onion.peel()

# ----------

  @create: (req, res, next) ->

    res.status 200
    res.data.body.user = {}
    return res.onion.peel()

# ----------

  @edit: (req, res, next) ->

    unless isValidObjectId req.params.id
      return res.onion.use( http.badRequest(new Error 'Invalid user id') ).peel()

    res.status 200
    res.data.body.users = {}
    return res.onion.peel()

# ----------

  @remove: (req, res, next) ->

    unless isValidObjectId req.params.id
      return res.onion.use( http.badRequest(new Error 'Invalid user id') ).peel()

    res.status 200
    res.data.body.users = {}
    return res.onion.peel()


module.exports = Controller