local r = app.router
local c = app.controllers

r.get('^/get_test', c.verb.get_test)
r.post('^/post_test', c.verb.post_test)
r.any('^/match_test', c.verb.match_test)

r.get('^/set_test', c.other.set_test)
r.get('^/error_test', c.other.error_test)

r.get('^/current_user_test', c.base.current_user, c.before_filter.current_user_test)
r.get('^/check_referer_test', c.base.check_referer, c.before_filter.check_referer_test)

r.get('^/sentinel_test', c.redis.sentinel)
r.get('^/redis_test', c.redis.test)
