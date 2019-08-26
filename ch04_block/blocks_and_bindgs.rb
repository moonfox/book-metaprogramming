# 在my_method方法中，代码块中看到的x变量依然中bing_context方法中的x = 'Hello',
# 而不是my_method方法中的x = 'Goodbye'，这个x对代码块来说是不可见的
class MyBlock
  def my_method
    x = 'Goodbye'
    yield('cruel')
  end

  def bing_context
    x = 'Hello'
    my_method { |y| "#{x}, #{y} world"}
  end
end

obj = MyBlock.new
puts obj.bing_context

# => Hello, cruel world
