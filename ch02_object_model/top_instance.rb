# =============================
# 目标1:
# 1、测试顶级上下文中定义的实例变量的作用域
# =============================
# 结论
# 1、顶级上下文中定义的实例变量只能被main对象访问，因为实例变量暴露在toplevel的context中，
#    self为main，
#    相当于运行main.instance_eval{@toplevel_variate="toplevel variate"}
# 2、私有方法不属于instance_methods的集合，它属于private_instance_methods
# =============================

# 相当于在main对象内部定义了@toplevel_variate
@toplevel_variate = "toplevel variate"

def my_method
  "@toplevel_variate in my_method which define in toplevel:#{@toplevel_variate}"
end

# 此时self已经切换为Object, 而Object中并没有定义@toplevel_variate
Object.class_eval do |variable|
  puts "Object can acccess @toplevel_variate:#{@toplevel_variate}" # nil
end

# 等效于顶级上下文
self.instance_eval do
  p '------'
  puts self
  puts self.class
  puts "@toplevel_variate in self object:#{@toplevel_variate}" # toplevel variate
  p '------'
end

puts my_method
puts "Object.private_instance_methods:" +
      Object.private_instance_methods(false).grep(:my_method).to_s # :my_method
puts "Object.instance_methods:" +
      Object.instance_methods(false).grep(:my_method).to_s #nil
puts "Object.private_methods:" +
      Object.private_methods(false).grep(:my_method).to_s #nil
puts "main.private_methods:" +
      self.private_methods(false).grep(:my_method).to_s # :my_method
