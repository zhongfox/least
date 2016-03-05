
if ngx.req.get_uri_args().type == 'error' then
  non_exist_func()
else
  ngx.say('hi')
end


--ngx.sleep(2)

--abc()

