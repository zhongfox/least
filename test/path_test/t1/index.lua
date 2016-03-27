package.path = '/Users/zhonghua/code/lua/least/test/path_test/t1/?.lua;' .. package.path
ngx.say("lua path: ", package.path)
ngx.say("x" .. tostring(x))
x = '3'
ngx.say("x" .. tostring(x))

ngx.say('out before _G.a: ' .. tostring(_G.a))
ngx.say('out before a: ' .. tostring(a))

test = require 'lib/r1'
test()

ngx.say('out after _G.a: ' .. tostring(_G.a))
ngx.say('out after a:' .. tostring(a))
