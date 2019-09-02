def lambda_double(callable_object)
  callable_object.call * 2
end
# return在定义它的lambda中返回
l = -> { return 10 }
puts lambda_double(l) #=> 20

# return在定义proc的上下文中返回
def proc_double
  pro = proc { return 10 }
  result = pro.call
  # 程序在这里返回

  # 程序不能执行到这里
  result * 2
end
puts proc_double #=> 10

# Exception: LocalJumpError: unexpected return
# 定义proc的上下文为顶级作用域，在顶级作用域中不能返回
# 在Ruby2.5以上版本中不会抛出异常，但也没有返回值
def another_proc_double(callable_object)
  callable_object.call
end
pro = Proc.new { return 10 }
puts another_proc_double(pro)
