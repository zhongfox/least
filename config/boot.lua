--for debug
function puts(info)
  ngx.log(ngx.ERR, info)
end

function app.record_time(start_time)
  local lua_time = ngx.now() - start_time
  --ngx.say(lua_time) --TODO 记入日志
  --ngx.var.lua_time = lua_time
  ngx.log(ngx.ERR, '耗时: ' .. tostring(lua_time))
end

function app.run(start_time)
  local start_time = ngx.now()
  local actions = app.router.match(ngx.var.uri)

  if not actions then
    app.record_time(start_time)
    return ngx.exit(ngx.HTTP_NOT_FOUND)
  end

  local request = {}
  local result

  for _, action in ipairs(actions) do
    result = action(request)
    if not result then return end
  end
  return result
end

--TODO 其他app需要完善的地方, 都写在此文件
