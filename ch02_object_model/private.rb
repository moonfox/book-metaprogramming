# =============================
# 目标1
# 1. 是否可以调用超类中的私有方法
# =============================
# 结论
# 1. 可以
# =============================

class MyClass
  def my_private_method
    "this is a private method"
  end

  private :my_private_method
end

class MySubClass < MyClass
  def testing_private_method
    my_private_method
  end
end

puts MySubClass.new.testing_private_method

