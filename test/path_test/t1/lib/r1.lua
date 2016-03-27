ngx.say('test/path_test/t1/lib/r1.lua')
a = 5

function test()
  a = a + 1
  ngx.say('inner _G.a: ' .. tostring(_G.a))
  ngx.say('inner a: ' .. tostring(a))
end

return test;
