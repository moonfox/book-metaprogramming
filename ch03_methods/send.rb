# send突破了私有性问题
# public_send保持了私有性原则

class MyClass
  def private_method
    puts 'I am privated method, you can not called me'
  end

  private :private_method
end

obj = MyClass.new
obj.send(:private_method)

# obj.private_method # => private method private_method