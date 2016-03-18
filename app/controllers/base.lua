local M = {}

function M:current_user ()
  self.current_user = ngx.req.get_uri_args().user
  return true
end

function M.check_referer ()
  if ngx.var.http_referer == 'http://www.abc.com' then
    return true
  else
    ngx.say('bad referer')
    return false
  end
end


return M
