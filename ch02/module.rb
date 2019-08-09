module M
  class C
    X = 'a constant'
  end
end

puts M.constants

module M
  Y = 'a contstant in M'

  p Module.constants
end

p M.constants

puts "All Constants Of TOP LEVEL"
# 返回当前范围所有顶层常量
# p Module.constants

Module.module_eval do
  def hello_mod
    puts 'a hello-mod method in Module'
  end
end


M.hello_mod
String.hello_mod
p Module.instance_methods(false).grep(/^hello/)
p Class.instance_methods(true).grep(/^hello/)
