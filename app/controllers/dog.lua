local M = {}

function M.check ()
  if ngx.req.get_uri_args().type == 'good' then
    return true
  else
    return false
  end
end

function M:current_user ()
  self.current_user = ngx.req.get_uri_args().user
  return true
end

function M.eat ()
  ngx.say 'dog eat'
end

function M:run ()
  ngx.say 'dog run'
  ngx.say(self.current_user)
end


return M
