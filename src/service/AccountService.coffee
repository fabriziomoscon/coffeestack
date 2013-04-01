UserMapper      = require 'src/mapper/User'
UserModel       = require 'src/model/User'
UserRepository  = require 'src/repository/User'
isValidObjectId = require 'src/validator/type/ObjectId'
isValidEmail    = require 'src/validator/email'

class AccountService

  constructor: (UserRepo = UserRepository) ->
    throw new Error 'Invalid repository' unless UserRepo instanceof Function
    @userRepository = new UserRepo


  createUser: (user, callback) ->
    throw new Error 'Invalid callback' unless callback instanceof Function
    return callback new Error 'Invalid User' unless user instanceof UserModel
    
    @findUserByEmail user.email, (err, user) =>
      return callback err, null if err?
      return callback new Error('email already used'), null if user?
      @userRepository.add user, callback


  findUserByEmail: (email, callback) ->
    throw new Error 'Invalid callback' unless callback instanceof Function
    return callback new Error('Invalid email') unless isValidEmail email
    @userRepository.findOneByEmail email, callback


  findUserById: (userId, callback) ->
    throw new Error 'Invalid callback' unless callback instanceof Function
    throw new Error 'Invalid userId' unless isValidObjectId userId
    @userRepository.findOneById userId, callback


  updateUserById: (userId, user, callback) ->
    throw new Error 'Invalid callback' unless callback instanceof Function
    return callback new Error('Invalid userId'), null unless isValidObjectId userId
    return callback new Error('Invalid user'), null unless user instanceof UserModel

    if user.email?
      
      @findUserByEmail user.email, (err, userFound) =>
        return callback err, null if err?
        if userFound? and userId isnt userFound.id
          return callback new Error('Email already used'), null

        return @userRepository.update userId, user, callback

    else

      return @userRepository.update userId, user, callback


  findAllUsers: (callback) ->
    throw new Error 'Invalid callback' unless callback instanceof Function
    @userRepository.findAllUsers callback


  removeUserById: (userId, callback) ->
    throw new Error 'Invalid callback' unless callback instanceof Function
    return callback new Error('Invalid userId'), null unless isValidObjectId userId
    @userRepository.remove userId, callback


module.exports = AccountService