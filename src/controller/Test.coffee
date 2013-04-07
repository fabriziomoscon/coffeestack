MongoGateway = require 'src/lib/mongo/Gateway'

http = require 'src/controller/helper/httpResponse'

AccountService = require 'src/service/Account'

UserMapper = require 'src/mapper/User'

class Controller

  @dropDatabase: (req, res) ->

    alwaysResponsInJSON req, res

    return res.onion.use( http.badRequest 'Invalid ENV' ).peel() unless process.env.NODE_ENV is 'testing'

    MongoGateway.db.dropDatabase (err) ->
      return res.onion.use( http.serverError err ).peel() if err?

      res.format = 'application/json'
      res.status 200
      return res.onion.peel()


  @loadFixtures: (req, res) ->

    alwaysResponsInJSON req, res

    return res.onion.use( http.badRequest 'Invalid ENV' ).peel() unless process.env.NODE_ENV in ['testing', 'staging']

    loadUsers req, res, (err) ->
      return res.onion.use( http.serverError err ).peel() if err?
        
      res.format = 'application/json'
      res.status 200
      return res.onion.peel()

  
  @loadFixturesUsers: (req, res) ->

    alwaysResponsInJSON req, res

    return res.onion.use( http.badRequest 'Invalid ENV' ).peel() unless process.env.NODE_ENV in ['testing', 'staging']

    loadUsers req, res, (err) ->
      return res.onion.use( http.serverError err ).peel() if err?
      
      res.format = 'application/json'
      res.status 200
      return res.onion.peel()


module.exports = Controller

# local functions

alwaysResponsInJSON = (req, res) ->
  res.onion.use (req,res,peel) ->
    res.format = 'application/json'
    peel()


loadUsers = (req, res, callback) ->
  as = new AccountService
  for key, userData of require('test/data/db/users').getData()
    as.createUser UserMapper.unmarshall(userData), (err, result) ->
      console.log err if err?
      return callback err, null if err?

  return callback null, null