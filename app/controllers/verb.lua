local M = {}

--curl http://127.0.0.1:8001/get_test
function M.get_test () 
  ngx.say 'http by get'
end

--curl -X POST http://127.0.0.1:8001/post_test
function M.post_test () 
  ngx.say 'http by post'
end

--curl -X POST http://127.0.0.1:8001/match_test
--curl http://127.0.0.1:8001/match_test
function M.match_test () 
  ngx.say 'http by match'
end

return M
