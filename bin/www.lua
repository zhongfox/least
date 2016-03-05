local start_time = ngx.now()


status, result = pcall(function () require "../app" end)
-- 模拟长时间lua执行
ngx.sleep(1) --为什么放到app.lua中会报错

local lua_time = ngx.now() - start_time

if not status then
  ngx.log(ngx.ERR, result)
  ngx.say('error: ', result)
  ngx.say(lua_time) --TODO 记入日志
  ngx.exit(ngx.HTTP_INTERNAL_SERVER_ERROR)
end


ngx.say(lua_time) --TODO 记入日志

--require "../app"




