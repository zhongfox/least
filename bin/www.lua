local start_time = ngx.now()
local app = require 'app'

local status, result = pcall(app.run, start_time)

if status then
  app.record_time(start_time)
  return result
else
  ngx.log(ngx.ERR, tostring(result))
  app.record_time(start_time)
  ngx.exit(ngx.HTTP_INTERNAL_SERVER_ERROR)
end
