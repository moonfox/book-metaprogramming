# 使用实例变量，以便不同的方法可以访问

event "the sky is falling" do
  @sky_height < 300
end

event "it's getting closer" do
  # 在block中定义的局部变量，在这个block执行完后就消失了，不能被其它block共享
  # Uncaught exception: undefined local variable or method `z'
  # z + 1
  @sky_height < @mountain_height
end

setup do
  # z = 0
  puts "setting up sky"
  @sky_height = 100
end

setup do
  puts "setting up mountain"
  @mountain_height = 200
end
