class MyBlock
  def a_method(a, b)
    a + yield(a, b)
  end
end

block = MyBlock.new
puts block.a_method(1, 2) { |x, y| (x + y) * 3 }
# => 10

