class MyClass
  def testing_self
    @var = 10
    my_method()
    self
  end

  def my_method
    @var = @var + 1
  end
end

# 调用testing_self时，接收者是obj,所以obj为self,此时testing_self方法中的实例变量@var
# 属于obj对象，my_method没有明确的接收者，所以当前self也是obj，所以my_method方法中的@var
# 也属于obj对象

obj = MyClass.new
p obj.testing_self # => <MyClass:0x00007f81468a86e8 @var=11>