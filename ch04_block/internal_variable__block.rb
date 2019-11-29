# 外部变量的值会受到块内已经定义同名变量的影响
# 块内部已经定义的变量的值，不受外部同名变量影响

def my_method
  firstname = "Maria"
  lastname = "Sharapova"
  yield "Hi! I'm"
end

firstname = "Max"
lastname = "Black"
day = "Sun"

myname = lambda { |say| day = "Mon"; puts "test3: #{say} #{firstname} #{lastname} at #{day}"}
my_method &myname
#＝> Hi! I'm Max Black at Mon

puts "test3: day:#{day}"
# => Mon

day = "Wed"
my_method &myname
#＝> Hi! I'm Max Black at Mon