local M = {}
local redis_connector = require "resty.redis.connector"

function M.test ()
  local rc = redis_connector.new()

  --普通连接
  --local redis, err = rc:connect{ url = "redis://127.0.0.1:6379/0" }

  --哨兵连接
  local redis, err = rc:connect{
      url = "sentinel://m6381:m/0",
      sentinels = {
          { host = "127.0.0.1", port = "26381" },
          { host = "127.0.0.1", port = "26382" },
          { host = "127.0.0.1", port = "26383" }
      }
  }

  if not redis then
    ngx.say("failed to connect: ", err)
    return
  end

  ok, err = redis:incr("counter")
  if not ok then
    ngx.say("failed to write redis : ", err)
    return
  end

  ngx.say("set result: ", ok)

  local res, err = redis:get("counter")
  if not res then
    ngx.say("failed to read redis: ", err)
    return
  end

  if res == ngx.null then
    ngx.say("counter not found.")
    return
  end

  ngx.say("get counter: ", res)

end

return M
