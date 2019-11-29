# 类变量可以被其子类及其实例对象访问
# 类方法可以被子类继承
class MyClass
  @@var = 1
  @@counter = 0

  def self.my_counter
    puts @@counter
  end
end

class SubClass < MyClass
  def initialize
    @@counter += 1
  end

  def my_method
    puts @@var
  end

  def self.my_method
    puts @@var
  end
end

obj = SubClass.new
obj.my_method # => 1
SubClass.my_method # => 1

obj2 = SubClass.new
puts SubClass.my_counter # => 2
puts MyClass.my_counter # => 2
