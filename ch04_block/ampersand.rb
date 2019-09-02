# 使用&符号，让block变得可以在方法间转递
class MyBlock
  def math_(a, b)
    yield(a, b)
  end

  def do_math(a, b, &operation)
    math_(a, b, &operation)
  end
end

obj = MyBlock.new
puts obj.do_math(2, 3) { |x, y| x**y } # => 8
