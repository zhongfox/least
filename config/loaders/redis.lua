local clients = {}
local redis_connector = require "resty.redis.connector"
local resty_redis = require "resty.redis"


local RedisClient = {}
local mt = { __index = RedisClient }

function RedisClient:new(redis_config)
  local client = {}
  client.redis_config = redis_config
  setmetatable(client, mt)
  return client
end

function RedisClient:run(cmd, ...)
  --local client = resty_redis:new()
  --local ok, err = client:connect(self.redis_config)
  local rc = redis_connector.new()
  local client, err = rc:connect(self.redis_config)

  if not client then
    ngx.log(ngx.ERR, "failed to connect: " .. err)
    return
  end

  local res, err = client[cmd](client, ...)

  if err then
    ngx.log(ngx.ERR, "failed to run redis cmd: " .. err)
    return
  end

  --put it into the connection pool of size 100,
  --with 10 seconds max idle time
  local ok, err = client:set_keepalive(10000, 10)
  if not ok then
    ngx.log(ngx.ERR, "failed to set keepalive:" .. err)
    return
  end

  return res
end


clients.master = RedisClient:new{ip=app.settings.ip, port=app.settings.port}
clients.sb = RedisClient:new{
  url = 'sentinel://' .. app.settings.redis.sb.master_name .. ':m/0',
  sentinels = app.settings.redis.sb.sentinels
}


return clients
