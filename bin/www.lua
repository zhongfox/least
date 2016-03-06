local start_time = ngx.now()

local entry_point = assert(loadfile("./app.lua"))
local status, result = pcall(entry_point)
local lua_time = ngx.now() - start_time

if not status then
  ngx.log(ngx.ERR, result)
  ngx.say('error: ', result)
  ngx.say(lua_time) --TODO 记入日志
  ngx.exit(ngx.HTTP_INTERNAL_SERVER_ERROR)
end


ngx.say(lua_time) --TODO 记入日志

--require "../app"




