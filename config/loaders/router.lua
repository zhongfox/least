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

function Router.any(...)
  local route, actions = resolve(...)
  Router.add('ANY', route, actions)
end

function Router.match(uri)
  for _, router in ipairs(routes) do
    if (router.method == 'ANY' or router.method == ngx.var.request_method) and
      ngx.re.match(uri, router.route) then
      return router.actions
    end
  end
end

return Router
