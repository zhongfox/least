启动
`/opt/openresty1_5_12/nginx/sbin/nginx -p ./ -c config/nginx.conf`
重启
`/opt/openresty1_5_12/nginx/sbin/nginx -p ./ -c config/nginx.conf -s reload`


哨兵测试:

详见 `test/sentinel_test_conf/how_to_test_sentinel.md`

pcall 测试:

http://127.0.0.1:8001/pcall?type=error
