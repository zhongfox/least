app = {}
require 'config/boot'

app.controllers = require 'config/loaders/controllers'
app.router = require 'config/loaders/router'

require 'config/routes'
return app
