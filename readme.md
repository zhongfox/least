
## Least Surprise

### 启动/重启

* 启动 `/opt/openresty1_5_12/nginx/sbin/nginx -p ./ -c config/nginx.conf`
* 重启 `/opt/openresty1_5_12/nginx/sbin/nginx -p ./ -c config/nginx.conf -s reload`

### HTTP 动词测试

* curl http://127.0.0.1:8001/get_test
* curl -X POST http://127.0.0.1:8001/post_test
* curl -X POST http://127.0.0.1:8001/match_test
* curl http://127.0.0.1:8001/match_test

### before filter 测试

* curl http://127.0.0.1:8001/check_referer_test
* curl --referer http://www.abc.com http://127.0.0.1:8001/check_referer_test
* curl http://127.0.0.1:8001/current_user_test
* curl http://127.0.0.1:8001/current_user_test\?user\=zhonghua

### set 测试

* curl http://127.0.0.1:8001/set_test

### 错误捕获测试

* curl http://127.0.0.1:8001/error_test

### redis测试

* 普通redis测试: curl http://127.0.0.1:8001/redis_test

* 哨兵测试:

  启动哨兵详见 `test/sentinel_test_conf/how_to_test_sentinel.md`

  * curl  http://127.0.0.1:8001/sentinel_test
