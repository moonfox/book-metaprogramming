# 使用instance_eval查看对象内部
class MyBlock
  def initialize
    @var = 1
  end
end

obj = MyBlock.new
obj.instance_eval do
  puts @var # => 1
  puts self # => #<MyBlock:0x00007ff72b073cd8>
end

# 把var通过block传入obj对象内部
var = 2
obj.instance_eval do
  @var = var
  puts @var # => 2
  puts self # => #<MyBlock:0x00007ff72b073cd8>
end

# 当传入一个block时，obj被作为block的唯一参数被传入
puts obj.instance_eval {|obj_self| obj_self == self } # => true
