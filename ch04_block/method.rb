# method对象
# 通过method、singleton_method方法获取method对象
# 是可调用对象，通过call调用
# 执行环境为当前对象的作用域
# method对象没有bind方法
# 可以转换为unbound对象：使用unbind方法
class MyClass
  def my_method
    puts "oyouo"
  end
end

# 把方法应用到子类
lambda {
  obj = MyClass.new
  um = obj.method(:my_method)
  D = Class.new(MyClass) do
    define_method :another_method, um
  end

  obj_d = D.new
  obj_d.another_method
  # => oyouo
}

# 把方法应用到其它类，要把method转化为proc对象才可以
lambda {
  obj = MyClass.new
  um = obj.method(:my_method)
  D = Class.new do
    define_method :another_method, um.to_proc
  end

  obj_d = D.new
  obj_d.another_method
  # => oyouo
}

# 不能直接把method对象，使用到非子类中
lambda {
  obj = MyClass.new
  um = obj.method(:my_method)
  D = Class.new do
    define_method :another_method, um
  end

  obj_d = D.new
  obj_d.another_method
  # => Uncaught exception: bind argument must be a subclass of MyClass
}