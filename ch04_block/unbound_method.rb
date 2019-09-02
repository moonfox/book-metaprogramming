# UnboundMethod应用
# 通过instance_method方法得到UnboundMethod对象
module MyUnbound
  def my_method
    'you can bind me'
  end
end

# 从模块抽取方法，使用bind方法
lambda {
  um = MyUnbound.instance_method(:my_method)
  a = 'hello'

  # 要对um(method)对象进行call调用，而不是a.my_method
  a_um = um.bind(a)
  puts a_um.call
  # => you can bind me
}

# 从模块抽取方法，与define_method结合使用，生成类的实例方法
lambda {
  um = MyUnbound.instance_method(:my_method)

  String.send(:define_method, :string_my_method, um)
  a = 'hello world'
  puts a.string_my_method
  # => you can bind me
}

# 从类抽取方法
lambda {
  class Square
    def area
      @side * @side
    end

    def initialize(side)
      @side = side
    end
  end

  area_un = Square.instance_method(:area)

  s = Square.new(12)
  area = area_un.bind(s)
  puts area.call
  #=> 144
}

# 可以对原方法进行保护
lambda {
  class Test
    def test
      :original
    end
  end
  um = Test.instance_method(:test)
  class Test
    def test
      :modified
    end
  end
  t = Test.new
  puts t.test            #=> :modified
  puts um.bind(t).call   #=> :original
}
