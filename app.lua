print('lua app starting...')

app = {}
require 'config/boot'

app.controllers = require 'config/loaders/controllers'
app.router      = require 'config/loaders/router'
app.redis       = require 'config/loaders/redis'

require 'config/routes'
return app
