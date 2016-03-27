package.path = '/Users/zhonghua/code/lua/least/test/path_test/t2/?.lua;' .. package.path
ngx.say("lua path: ", package.path)
ngx.say("x" .. tostring(x))

test = require 'lib/r1'
test()
ngx.say("a" .. tostring(a))

