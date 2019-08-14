require File.expand_path('../lib/db', File.dirname(__FILE__))

class Computer
  def initialize(id)
    @data = Db.new(id)
  end

  # 如果代理的对象不能响应missing的方法，应该抛出异常
  def method_missing(method, *args, &blk)
    name = method
    get_info = "get_#{name}_info"
    get_price = "get_#{name}_price"
    super unless @data.respond_to?(get_info)

    info = @data.send(get_info)
    price = @data.send(get_price)
    resutl = "#{name}: #{info} ($#{price})"
    resutl = "* #{resutl}" if price > 100
    resutl
  end
end

lambda {
  pc = Computer.new(3)
  puts pc.cpu
  puts pc.mouse
  puts pc.keyboard

  # => false
  # 对象不知道幽灵方法的存在
  puts "pc.respond_to?(:cpu): #{pc.respond_to?(:cpu)}"

  # method_missing': undefined method `spin' for
  # 如果代理的对象不能响应missing的方法，应该抛出异常
  # pc.spin
}

# 通过重定义respond_to_missing方法，让对象感知幽灵方法
class Computer
  def respond_to_missing?(method, include_private=false)
    @data.respond_to?("get_#{method}_info") || super
  end
end

# 每次重定`method_missing`方法时，应该也重写`respond_to_missing`，
# 谁让其对幽灵方法返`true`， 以便让对象的`respond_to`方法返回`true`，
# 即让对象也可以感知对幽灵方法
lambda {
  pc = Computer.new(1)
  puts pc.cpu
  puts pc.mouse
  puts pc.keyboard

  puts "pc.respond_to?(:cpu): #{pc.respond_to?(:cpu)}"

  # spin不是幽灵方法，所以会抛出异常
  # `method_missing': undefined method `spin'
  puts pc.spin
}
