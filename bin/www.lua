local start_time = ngx.now()
local function record_time()
  local lua_time = ngx.now() - start_time
  --ngx.say(lua_time) --TODO 记入日志
  --ngx.var.lua_time = lua_time
end

local app = require 'app'
local action = app.routes.get_current_action()

if not action then
  record_time()
  ngx.exit(ngx.HTTP_NOT_FOUND)
end

local status, result = pcall(action)

if not status then
  ngx.log(ngx.ERR, '出错了.......................') --TODO 去掉
  ngx.log(ngx.ERR, result)
  record_time()
  ngx.exit(ngx.HTTP_INTERNAL_SERVER_ERROR)
end

record_time()
