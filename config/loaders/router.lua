local routes = {}
local Router = {}

local function resolve(...)
  --TODO 参数检测
  local route
  local actions = {}

  for index, item in ipairs{...} do
    if (index == 1) then
      route = item
    end
    actions[index-1] = item
  end

  return route, actions
end

function Router.add(method, route, actions)
  routes[#routes + 1] = {
    method=method,
    route=route,
    actions=actions
  }
end

function Router.get(...)
  local route, actions = resolve(...)
  Router.add('GET', route, actions)
end

function Router.post(...)
  local route, actions = resolve(...)
  Router.add('POST', route, actions)
end

function Router.match(uri)
  for _, router in ipairs(routes) do
    if (router.method == 'ALL' or router.method == ngx.var.request_method) and
      string.match(uri, router.route) then
      return router.actions
    end
  end
end

-------------------------------------------------
--
--
-- local function current_action ()
--   local action_string = ngx.var.action
--   local dot_index = string.find(action_string, '.', 1, true)
--   local controller = string.sub(action_string, 1, dot_index-1)
--   local action = string.sub(action_string, dot_index+1, -1)
--
--   return app.controllers[controller][action]
-- end
--
-- function router.get_current_action ()
--   local status, result = pcall(current_action)
--
--   if not status then
--     return nil
--   end
--   return result
-- end

return Router
