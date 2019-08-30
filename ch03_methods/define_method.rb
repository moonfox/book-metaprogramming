# define_method的使用，官方例子
# define_method(symbol, method)     -> symbol
# define_method(symbol) { block }   -> symbol
# The method parameter can be a Proc, a Method or an UnboundMethod object.
class A
  def fred
    puts 'In Fred'
  end

  def create_method(name, &block)
    self.class.define_method(name, &block)
  end
  define_method(:wilma) { puts 'Charge it!' }

  def create_method_with_no_block(name, method)
    self.class.define_method(name, method)
  end
end

class B < A
  define_method(:barney, instance_method(:fred))
end

a = B.new
puts a
a.barney
a.wilma
a.create_method(:betty) { p self }
a.create_method_with_no_block(:gaga, Proc.new{ puts 'gaga define_method'})
a.betty
a.gaga
