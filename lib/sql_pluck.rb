##
# Provides #pluck_by_sql method.
#
# Usage:
#   class SomeModel < ActiveRecord::Base
#     extend SQLPluck
#   end
#   SomeModel.pluck_by_sql(['select * from some_model where created_at > ?', time])
#
module SQLPluck
  ##
  # Executes +sql+ as SQL SELECT statement and
  # returns the result as an array of array of field values,
  # like .pluck method.
  #
  def pluck_by_sql(sql, binds = [])
    result = connection.select_all(sanitize_sql(sql), "#{name} Load", binds)
    result.cast_values(result.column_types)
  end
end
