class Car
  def engine_start
    'engine_start: 你没有被污染，可以启动'
  end
end

your_name = 'Caroline Channing'

# =============================
# 目标1
# 1. 不带true
# =============================
# 结论
# 1. Ruby会把load_file.rb中的Car类带入当前上下文，造成对Car类的重新打开
# 2. 变量不会被影响
# =============================
lambda {
  load File.expand_path('load_file.rb', File.dirname(__FILE__))

  puts '=======不带true======='
  puts Car.new.engine_start
  puts "your_name: #{your_name}"
}

# =============================
# 目标1:
# 1. 带true
# =============================
# 结论
# 1. Ruby会创建一个匿名模块，用它作为命名空间来容纳load_file.rb中的常量，
#    让其仅在自身范围内有效，当加载完成后，该模块会被销毁，不会污染引用它的文件
#    此时，当前上下文的Car没有被修改(看不到load_file.rb中的Car类)
# 2. load一个文件应该加入true，表示用这个文件完成某些任务，而不会影响到当前引用它的文件
# 3. 变量不会被影响
# =============================
lambda {
  load File.expand_path('load_file.rb', File.dirname(__FILE__)), true

  puts '=======带true======='
  puts "your_name: #{your_name}"
  puts Car.new.engine_start
}
