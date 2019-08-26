# 注意作用域的切换
# 定义类时，类作用域中的代码是立刻执行的

v1 = 1
# 进入MyClass作用域
class MyClass
  v2 = 2
  # 立刻执行
  p local_variables # => [:v2]

  # 没有执行
  def my_method
    v3 = 3
    p local_variables
  end

  # 立刻执行
  p local_variables # => [:v2]
end
# MyClass作用域结束

# 进入顶级作用域
obj = MyClass.new

# 进入obj对象作用域
obj.my_method # => [:v3]
obj.my_method # => [:v3]

# 进入顶级作用域
p local_variables #=> [:v1, :obj]
