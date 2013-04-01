_ = require 'underscore'

module.exports = (request, response, peel) ->

  if response.format is 'text/html'

    response.data.meta.title = 'Bizzby'

  peel()