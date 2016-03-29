local controllers = {}
local files = io.popen('ls ' .. app.root .. 'app/controllers/*.lua')


for controller_path in files:lines() do
  controller_name = controller_path:match('app/controllers/(.+).lua')
  require_path = controller_path:match(app.root .. '(.+).lua')
  controllers[controller_name] = require(require_path)
end

--https://groups.google.com/forum/#!topic/openresty/q8D7-gh76nU
--https://groups.google.com/forum/#!topic/openresty/BO1_Geg5xxY
--TODO 会有少量错误
files:close()

return controllers
