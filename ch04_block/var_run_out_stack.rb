# 即使变量已经出栈，它依然可以在绑定它的block中存在
# 当generate_block方法返回时，变量x=10已经出栈，但调用generate_block方法时，依然可以访问
# 到这个x=10，这就是闭包的特性
# 同时也说明Ruby源码中，局变变量是保存的堆上的，而不是栈上
class MyBlock
  def generate_block
    x = 10
    proc = Proc.new {|y| x + y }
    proc
  end

  def my_block(&block)
    x = 100
    block.call(1)
  end
end

obj = MyBlock.new
# 这里的x = 200也不会影响到闭包里的x = 10的值
x = 200
block = obj.generate_block
puts obj.my_block(&block)
# => 11