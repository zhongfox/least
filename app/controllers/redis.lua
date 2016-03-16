local M = {}

--curl  http://127.0.0.1:8001/redis_test
function M.test ()
  ngx.say("set result: ", app.redis.master:run('set', 'fox', 'good'))
  ngx.say("get result: ", app.redis.master:run('get', 'fox'))
end

--curl  http://127.0.0.1:8001/sentinel_test
function M.sentinel ()
  ngx.say("incr counter: ", app.redis.sb:run('incr', 'counter'))
  ngx.say("get counter: ", app.redis.sb:run('get', 'counter'))
end

return M
