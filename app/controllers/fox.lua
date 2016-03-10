local M = {}

function M.eat () 
  ngx.say 'fox eat'
end

function M.run () 
  bad_fox()
end


return M
