# 类的实例变量不能被子类继承
class MyClass
  @my_var = 'instance_variable_of_class'
end

class SubClass < MyClass
  def self.read
    @my_var
  end

  def self.write
    @my_var = 'instance_variable_of_sub_class'
  end
end

puts SubClass.read # => nil
SubClass.write
puts SubClass.read # => instance_variable_of_sub_class