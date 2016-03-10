local M = {}

function M.eat () 
  ngx.say 'cat eat'
end


function M.run () 
  ngx.say 'cat run'
end


return M
