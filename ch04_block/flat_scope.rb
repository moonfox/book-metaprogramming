# 局部变量穿越作用域
my_var = 'Success'

MyScope = Class.new do
  puts "#{my_var} in the class definition"

  define_method :my_method do
    puts "#{my_var} in the method"
  end
end

obj = MyScope.new
obj.my_method

# => Success in the class definition
# => Success in the method