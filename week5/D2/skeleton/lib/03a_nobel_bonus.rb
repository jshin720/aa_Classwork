# == Schema Information
#
# Table name: nobels
#
#  yr          :integer
#  subject     :string
#  winner      :string

require_relative './sqlzoo.rb'

def physics_no_chemistry
  # In which years was the Physics prize awarded, but no Chemistry prize?
  execute(<<-SQL)

  SELECT *

  FROM nobels
  GROUP BY yr
  --HAVING  
   -- COUNT(subject = 'Physics') > 0
   -- AND COUNT(subject = 'Chemistry') = 0

    ORDER BY yr 
      LIMIT 10

  SQL
end

