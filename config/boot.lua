print('lua app ' .. app.name .. ' booting...')

app.root = ngx.var.lua_root .. app.name .. '/'

app.require = function(relative_path_from_root)
  return require(app.name .. '.' .. relative_path_from_root)
end

app.record_time = function(start_time)
  local lua_time = ngx.now() - start_time
  --ngx.say(lua_time) --TODO 记入日志
  --ngx.var.lua_time = lua_time
  ngx.log(ngx.ERR, '耗时: ' .. tostring(lua_time))
end

app.run = function (start_time)
  local start_time = ngx.now()
  local actions = app.router.match(ngx.var.uri)

  if not actions then
    app.record_time(start_time)
    return ngx.exit(ngx.HTTP_NOT_FOUND)
  end

  local request = {}
  local result

  for _, action in ipairs(actions) do
    result = action(request)
    if not result then return end
  end
  return result
end

app.settings    = app.require 'config/loaders/settings'
app.controllers = app.require 'config.loaders.controllers'
app.router      = app.require 'config.loaders.router'
app.redis       = app.require 'config.loaders.redis'

app.require 'config.routes'

app.booted = true
