local M = {}

--curl http://127.0.0.1:8001/check_referer_test
--curl --referer http://www.abc.com http://127.0.0.1:8001/check_referer_test
function M.check_referer_test ()
  ngx.say 'Congratulations, you are from www.abc.com'
end

--curl http://127.0.0.1:8001/current_user_test
--curl http://127.0.0.1:8001/current_user_test\?user\=zhonghua
function M:current_user_test ()
  ngx.say('current user is ' .. tostring(self.current_user))
end


return M
