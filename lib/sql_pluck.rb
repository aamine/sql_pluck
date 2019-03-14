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
    rs = connection.select_all(sanitize_sql(sql), "#{name} Load", binds)
    types = rs.column_types
    rs.map {|record| cast_record(record, types) }
  end

  private

  def cast_record(record, types)
    record.map {|name, string| types[name].type_cast(string) }
  end
end

if defined?(ActiveRecord::Type)
  class ActiveRecord::Type::Value   # reopen
    public :type_cast
  end
end
