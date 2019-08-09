# load './load.rb'
load './load.rb', true

class MyClass
  def greeting
    puts "hello, Max"
  end
end

puts "=======in load_use.rb======="
my_class = MyClass.new

my_class.greeting

# 不带true
# Ruby会把load.rb中的类带入当前上下文，会造成对MyClass类的修改(添加了clean_dirty方法)
# 同时也把Car类带入当前上下文

# 带true
# Ruby会创建一个匿名模块，用它作为命名空间来容纳load.rb中的常量，让其仅在自身范围内有效，
# 当加载完成后，该模块会被销毁，不会污染引用它的文件
# 此时，当前上下文的MyClass没有被修改(没有添加方法clean_dirty)，也看不到Car类

# load一个文件应该加入true，表示用这个文件完成某些任务(MyClass.new.clean_dirty)，
# 而不会影响到当前引用它的文件

Car.new("BMW X6").engine_start

my_class.clean_dirty
