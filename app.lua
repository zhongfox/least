print('lua app starting...')

app = {}
require(app_name .. '.config.boot')

app.controllers = app.require 'config.loaders.controllers'
app.router      = app.require 'config.loaders.router'
app.redis       = app.require 'config.loaders.redis'

app.require 'config.routes'
return app
