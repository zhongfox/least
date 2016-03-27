local function merge_table(first, second)
  assert(type(first) == 'table', 'first is not table')
  assert(type(second) == 'table', 'second is not table')

  for k, v in pairs(second) do
    if type(first[k]) == 'table' and type(v) == 'table' then
      merge_table(first[k], v)
    elseif v ~= nil then
      first[k] = v
    end
  end
end

return merge_table

-- TEST
-- a = {x = 1, y = {1,2,3}, z = {n='n', m ='m'}, a = true}
-- merge_table(a, {y={4,5}, z = {n='nn', j='jj'}, a = nil})
-- print(require('./lib/utils/table_tostring')(a))
