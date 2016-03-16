local M = {}

--curl http://127.0.0.1:8001/set_test
function M.set_test () 
  --ngx.say 'cat eat'
  return 123
end

--curl  http://127.0.0.1:8001/error_test
function M.error_test () 
  no_exist_func()
end

return M
