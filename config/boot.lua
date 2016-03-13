function app.run()
  local actions = app.router.match(ngx.var.uri)

  
  ngx.log(ngx.ERR, tostring(actions))

  if not actions then
    --record_time()
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
