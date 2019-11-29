# =============================
# 目标1:
# 1、测试在实例方法中再定义一个方法，这个方法属于实例方法还是类方法，还是对象的单例方法
# =============================
# 结论
# 1、my_method1和my_method2都是MyClass的实例方法，my_method2必须在调用my_method1后才会产生。
#    因为当前ruby追踪的类是MyClass(ruby总是在追踪一个当前类)，在调用my_method1时，当前类是MyClass,所以
#    def my_method2定义的方法是MyClass的实例方法
# 2、在类中定义的方法都是类的实例方法
# 3、my_method2的返回值是在实例方法my_method3的方法名，嵌套方法定义时出现
# 4、MyClass类的所有实例对象都可以使用这些方法，不管是已经存在的，还是在调用方法后产生的。因为这些方法已经是类的实例方法
# 重要:调用嵌套定义的方法时,由于ruby解释器一直在追踪当前类.调用method1时,当前对象是self(obj),当前类是self的类MyClass
#    因为ruby解释器会把所有def定义的方法作为当前类的实例方法，所以def my_method2会成为MyClass类的实例方法.
#    这种情况和在顶级作用域使用def定义方法一样，所定义的方法都为
#    Object的实例方法。如果改写成def self.my_method2,生成的my_method2方法为obj对象的单例方法。只能供obj对象自己
#    使用。这和在顶级作用域使用def self.xxx_method是一样的效果，xxx_method为main对象的单例方法，其它对象不能使用
# =============================
lambda {
  class MyClass
    def my_method1
      def my_method2
        def my_method3
          "test1: the my_method3 is instance method of MyClass"
        end
      end
    end
  end

  MyClass.new.my_method1
  MyClass.new.my_method2
  puts "test1: my_method2 retrun value is " +  MyClass.new.my_method2.to_s
  puts MyClass.new.my_method3
  puts "test1: MyClass's instance methods:" + MyClass.instance_methods(false).to_s
}.call


