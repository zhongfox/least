local start_time = ngx.now()
local app_name = 'least' --TODO 各项目不同

app = require(app_name .. '.app')
if (not app.booted) then
  app.name = app_name
  require(app_name .. '.config.boot')
end

local status, result = pcall(app.run, start_time)

if status then
  app.record_time(start_time)
  return result
else
  ngx.log(ngx.ERR, tostring(result))
  app.record_time(start_time)
  ngx.exit(ngx.HTTP_INTERNAL_SERVER_ERROR)
end
