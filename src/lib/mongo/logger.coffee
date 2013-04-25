module.exports = (log) ->

  log ?= {}

  unless log.error? and log.error instanceof Function
    log.error = console.log
    log.error 'Invalid error passed for Mongo => using console.log instead'
  
  unless log.info? and log.info instanceof Function
    log.info = console.log
    log.info 'Invalid info passed for Mongo => using console.log instead'

  unless log.debug? and log.debug instanceof Function
    log.debug = console.log
    log.debug 'Invalid debug passed for Mongo => using console.log instead'

  return {

    error: (message, command) ->

      log.error('\x1B[0;31mMongo ERR:\x1B[0m %s', message) if message?
      log.error('\x1B[0;31mMongo ERR:\x1B[0m %s', command) if command?

    log: (message, command) ->

      log.info('\x1B[0;33mMongo LOG:\x1B[0m %s', message) if message?
      log.info('\x1B[0;33mMongo LOG:\x1B[0m %s', command) if command?

    debug: (message, command) ->

      if message?
        log.debug "\x1B[0;36mMongo DEBUG:\x1B[0m %s", message

      if command?.json?
        log.debug "collection [#{command.json.collectionName}]" if command.json.collectionName?
        log.debug 'spec', command.json.spec if command.json.spec?
        log.debug 'query', command.json.query if command.json.query?
        log.debug 'document', command.json.document if command.json.document?

      # if command?.binary?
      #   log.debug 'Mongo DEBUG bin', command.binary

    doDebug: true
  }