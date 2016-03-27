app_root = '/Users/zhonghua/code/lua/least/'
app_name = 'least' --TODO

function require_from_root(relative_path_from_root)
  return require(app_root .. relative_path_from_root)
end

local start_time = ngx.now()
local app = require_from_root 'app'

local status, result = pcall(app.run, start_time)

if status then
  app.record_time(start_time)
  return result
else
  ngx.log(ngx.ERR, tostring(result))
  app.record_time(start_time)
  ngx.exit(ngx.HTTP_INTERNAL_SERVER_ERROR)
end
