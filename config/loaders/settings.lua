local settings = app.require 'config/settings'
local file_exists = app.require 'lib/utils/file_exists'

local table_tostring = app.require 'lib/utils/table_tostring'

if file_exists(app.root .. 'config/settings_local.lua') then
  local merge_table = app.require 'lib/utils/merge_table'
  merge_table(settings, app.require('config/settings_local'))
end

return settings
