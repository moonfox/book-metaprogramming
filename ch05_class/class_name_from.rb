# Ruby的把戏，类名
# 把匿名类赋值给常量，这个常量就表示这个类，同时这个类也表示这个常量，
# 否则类将无法得知自己的类名

c = Class.new(Array)
puts c.class # => Class
puts c.superclass #=> Array
puts c.name # => nil

MyClass = c
puts c.name # => MyClass
puts MyClass.name # => MyClass
