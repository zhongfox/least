启动一主2从:

    redis-server --port 6381

    redis-server test/sentinel_test_conf/6381_slave1.conf  --port 63811

    redis-server test/sentinel_test_conf/6381_slave2.conf  --port 63812

启动三个哨兵:

    redis-server ./test/sentinel_test_conf/s1.conf  --port 26381 --sentinel

    redis-server ./test/sentinel_test_conf/s2.conf  --port 26382 --sentinel

    redis-server ./test/sentinel_test_conf/s3.conf  --port 26383 --sentinel

在console中测试:

* 访问 http://127.0.0.1:8001/redis

  期望counter自增, 正常写入redis

* 现在把6381的主kill掉

* 立即访问 http://127.0.0.1:8001/redis

  页面会有短暂的报错

* 继续刷新 http://127.0.0.1:8001/redis

  哨兵已经自动进行失效转移和master选举

  期望counter自增, 正常写入redis

注意:

哨兵测试会修改`/test/`下的redis配置文件, 请勿将修改提交到git
