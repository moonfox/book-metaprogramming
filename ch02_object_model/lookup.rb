class MyClass
  def my_method; 'my_method()'; end
end

class MySubclass < MyClass
end

obj = MySubclass.new
puts obj.my_method

# my_method方法通过祖先链在MyClass类中找到
