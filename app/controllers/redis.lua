local M = {}

function M.test ()
  ngx.say("set result: ", app.redis.master:run('set', 'fox', 'good'))
  ngx.say("get result: ", app.redis.master:run('get', 'fox'))
end

function M.sentinel ()
  ngx.say("incr counter: ", app.redis.sb:run('incr', 'counter'))
  ngx.say("get counter: ", app.redis.master:run('get', 'counter'))
end

return M
