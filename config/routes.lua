local r = app.router
local c = app.controllers

r.get('^/cat_eat', c.cat.eat)
r.post('^/cat_run', c.cat.run)
r.get('^/fox_eat', c.fox.eat)
r.post('^/fox_run', c.fox.run)
r.get('^/dog_eat', c.dog.check, c.dog.eat)
r.get('^/dog_run', c.dog.current_user, c.dog.run)
