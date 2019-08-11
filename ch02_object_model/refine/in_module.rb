# 细化的作用域

# 总结: 被refine的方法是否生效与执行方法时的上下文件有关, 上下文是否有调用using.
# 用途: 在局部范围内生效，有效的防止打开类方法在全局起作用
#      使用refine可以把打开类的影响控制在一个模块中或使用using的文件中
# 范围: 1、从using语句开始到module结束或文件尾。2、refine方法内部
# 使用: 可以用refine定义新方法或重新定义已存在方法,也可以被include或prepend

class MyClass
  def my_method
    'original_my_method'
  end

  def another_method
    my_method
  end
end

module MyClassModule
  def method_in_mod
    'method_in_mod'
  end
end

module MyClassRefinements
  refine MyClass do

    # 注：refine代码块中不能调用include中包含的方法
    #    但不影响在obj.method_in_mod中的调用
    include MyClassModule

    def my_method
      'refined my_method'

      # 不能调用include中包含的方法，不懂呀不懂
      # 开打注释后报异常undefined local variable or method `method_in_mod'
      # "refined my_method #{method_in_mod}"
    end

    def last_name
      'Max'
    end

    def first_name
      'Black'
    end

    def full_name
      "#{first_name} #{last_name}"
    end
  end
end

# 在模块内使用using,refine作用范围到模块结尾结束
lambda {
  module MyModule
    using MyClassRefinements
    puts MyClass.new.my_method
    # => refined my_method
  end

  # 因为顶级上下文中没有使用using,所以不受refine影响
  puts MyClass.new.my_method
  # => original_my_method
}

# refine陷阱，此时refined没有起作用，不懂
lambda {
  using MyClassRefinements
  obj = MyClass.new

  puts obj.my_method
  # => refined my_method

  puts obj.another_method
  # => original_my_method

  # 打开MyClass后，重新定义another_method，refine方法生效
  # 此处依然不懂
  class MyClass
    def another_method
      my_method
    end
  end

  puts obj.another_method
  # => refined my_method
}


# 可以调用refine代码块内部include Mod中的方法
# 可以调用在refine代码块内部定义的方法
lambda {
    using MyClassRefinements
    obj = MyClass.new

    puts obj.method_in_mod
    # => method_in_mod

    puts obj.full_name
    # => Black Max
}


# 不能在类中使用refine
# class D
#   refined MyClass do
#   end
# end
