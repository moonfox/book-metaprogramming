# 在顶层定义方法时，当前类是Object类，所以在这个位置定义的方法可以被任何对象使用，
# 包括类本身，但这些方法是私有方法
lambda {
  def hello
    puts 'hello i am top-level method'
  end

  hello
  [].send(:hello)
  String.send(:hello)

  # 证明了在顶层定义方法时，是定义的Object的私有实例方法
  puts Object.private_instance_methods(false).grep(/^hel/) # => hello
}.call

# 定义的方法都是当前类的，即使是在方法中定义方法
# my_method2 也是类的实例方法，而不是实例对象的方法
lambda {
  class MyClass
    def my_method1
      puts 'my_method1'

      def my_method2
        puts 'my_method2'
      end
    end
  end

  obj = MyClass.new
  # obj.my_method1
  # obj.my_method2

  # 在对象obj1中动态定义的类的实例方法my_method2,在obj2中可以调用
  obj1 = MyClass.new.my_method1
  obj2 = MyClass.new.my_method2
}