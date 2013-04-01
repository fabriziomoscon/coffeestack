http = require 'src/controller/helper/httpResponse'

isValidObjectId = require 'src/validator/type/ObjectId'

AccountService = require 'src/service/Account'

UserMapper = require 'src/mapper/User'

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

    return res.onion.use( http.badRequest(new Error 'Invalid user data') ).peel() unless req.body?

    if req.method is 'POST'

      try user = UserMapper.unmarshall req.body
      catch err then return res.onion.use( http.badRequest(err)).peel()

      (new AccountService).create user, (err, user) ->
        return res.onion.use( http.serverError(error) ).peel() if error?

        res.status 200
        res.data.body.user = user
        return res.onion.peel()

    else return res.onion.peel()

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