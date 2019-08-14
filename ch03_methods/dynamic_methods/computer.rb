require File.expand_path('../lib/db', File.dirname(__FILE__))

class Computer
  def initialize(id)
    @data = Db.new(id)
  end

  def self.define_component(name)
    define_method(name) do
      info = @data.send("get_#{name}_info")
      price = @data.send("get_#{name}_price")
      resutl = "#{name}: #{info} ($#{price})"
      resutl = "* #{resutl}" if price > 100
      resutl
    end
  end

  define_component :cpu
  define_component :mouse
  define_component :keyboard
end

pc = Computer.new(2)
puts pc.cpu
puts pc.mouse
puts pc.keyboard