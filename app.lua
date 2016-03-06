ngx.log(ngx.ERR, 'loadinggggggggggggg')
ngx.sleep(1)  -- 模拟长时间lua执行

if ngx.req.get_uri_args().type == 'error' then
  non_exist_func()
else
  ngx.say('hi')
end
