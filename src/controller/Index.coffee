http = require 'src/controller/helper/httpResponse'


# ----------

index = (req, res, next) ->

  res.status 200
  return res.onion.peel()


module.exports = {index}