# 不要使用全局变量`$`开头的变量为全局变量，它们可以在任何地方被访问，
# 可以用顶级实例变量替代，顶级实例变量只有在`main`对象为`self`时，才可以访问

def a_scope
  $var = "some value"
end

def another_socpe
  $var
end

@var = "the top-level @var"

def my_method
  @var
end

class MyClass
  def my_method
    # 这里的@var不是顶级作用域中的，而是MyClass实例对象的
    # 由于当前对象不是顶级作用域中的main,所以无法访问它的@var
    @var = "This is not the top-level @var!"
  end
end

a_scope
puts another_socpe # => a_scope
puts my_method # => the top-level @var
puts MyClass.new.my_method # => This is not the top-level @var!
