require_relative 'employee'

class Manager < Employee
  attr_reader :salary
  attr_accessor :boss 
  
  def initialize(name, title, salary, boss)
    super
    @subordinates = []
  end


  def add_subordinates(employee)
   employee.boss = @name 
    @subordinates << employee
  end

  def bonus(multiplier)
   
    self.sum_total_sal * multiplier

  end

  def sum_total_sal
     sum = 0
    @subordinates.each do |grunt|
      if grunt.is_a?(Manager)
      
        sal = grunt.sum_total_sal  + grunt.salary
        
        sum += sal
      else
        sum += grunt.salary
      end
    end
    sum
  end

end

a = Manager.new('Ned', 	'Founder', 1000000,	nil)
b = Manager.new('Darren',	'TA Manager',	78000, 'Ned')
a.add_subordinates(b)
c= Employee.new('Shawna', 'TA', 12000,	'Darren')
d = Employee.new('David', 'TA',	10000,'Darren')
b.add_subordinates(c)
b.add_subordinates(d)

# p a
# p b

p a.bonus(5) # => 500_000
# p b.bonus(4) # => 88_000
# p d.bonus(3) # => 30_000