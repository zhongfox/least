local controllers = {}
local files = io.popen("ls app/controllers/*.lua") --TODO

for controller_path in files:lines() do 
  controller_name = controller_path:match('app/controllers/(.+).lua')
  require_path = controller_path:match('(.+).lua')
  controllers[controller_name] = require(require_path)
end

return controllers
