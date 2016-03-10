local routes = {}

local function current_action ()
  local action_string = ngx.var.action
  local dot_index = string.find(action_string, '.', 1, true)
  local controller = string.sub(action_string, 1, dot_index-1)
  local action = string.sub(action_string, dot_index+1, -1)

  return app.controllers[controller][action]
end

function routes.get_current_action ()
  local status, result = pcall(current_action)

  if not status then
    return nil
  end
  return result
end

return routes
