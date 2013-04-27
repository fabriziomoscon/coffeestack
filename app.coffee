process.env.NODE_ENV ?= 'development'

express = require 'express'
path    = require 'path'

global.log = require 'src/middleware/logger/log'

app = express()
app.set 'baseDir', path.resolve __dirname

app.configure require 'src/server/init'
app.configure require 'src/server/routes'

# Far better error stack debugging. Do not use in production!
if process.env.NODE_ENV is 'development'

  # Breakdown
  breakdown = require 'breakdown'
  app.use (err, req, res, next) ->
    breakdown err
    res.writeHead 500, 'Content-Type': 'text/plain'
    res.end err.stack

server = app.listen app.get('port'), '0.0.0.0'
log.info "LISTENING ON PORT #{app.get('port')}"