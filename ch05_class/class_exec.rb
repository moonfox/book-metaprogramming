class Thing
end

name = 'Max'
Thing.class_exec(name) do |first_name|
  puts "first_name:#{first_name}" # => first_name:Max
  def hello
    'hello'
  end
end

obj = Thing.new
puts obj.hello