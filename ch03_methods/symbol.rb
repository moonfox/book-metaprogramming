# 符号不能被修改，相同的符号代表同一个对象，它们的object_id相同
# 因此符号特别适合表示方法名

a = :hello
b = :hello

puts a === b # => true
puts a == b # => true
