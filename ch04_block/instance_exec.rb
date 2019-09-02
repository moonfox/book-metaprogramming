# 使用instance_exec查看对象内部，它可以接个参数
class C
  def initialize
    @x = 1
  end
end

class D
  # twisted 扭曲的
  def twisted_method
    # @y属于obj_d对象，它无法被obj_c对象看到，因为当前对象为obj_c，obj_c中并没有对@y
    # 进入初始化，所以@y为nil
    obj_c = C.new
    obj_c.instance_eval { "@x:#{@x}, @y: #{@y}"}
  end

  def correct_method
    @y = 2
    @z = 3
    # 可以通过为instance_exec传入参数，让@y, @z，作为block的参数，进入block中，
    # 从而让调用它的对象访问
    C.new.instance_exec(@y, @z) { |y, z| "@x:#{@x}, @y: #{y}, @z:#{z}"}
  end
end

obj_d = D.new
puts obj_d.twisted_method # => @x:1, @y:
puts obj_d.correct_method # => @x:1, @y: 2, @z:3





