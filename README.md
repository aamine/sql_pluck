# sql_pluck gem

Provide #pluck_by_sql method for Rails ActiveRecord models.
You can execute arbitrary SQL and get bare attribute values without
creating ActiveRecord objects, while values are casted to appropreate types.

## Usage:

```
class SomeModel < ActiveRecord::Base
  extend SQLPluck
end

SomeModel.pluck_by_sql('select id, name from some_model where id % 777 = 0')
# => [[777, 'name777'], [1554, 'name1554'], ...]

SomeModel.pluck_by_sql(['select id, name from some_model where created_at > ?', time])
# => [[1901, 'name1901'], [1902, 'name1902'], ...]
```
