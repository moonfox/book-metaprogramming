require 'ostruct'
require 'forwardable'

# Mock database source
class Db
  extend Forwardable

  Datas = [
    {
      id: 1,
      mouse: 'Mirco 980',
      mouse_price: 200,
      cpu: '2.16Ghz',
      cpu_price: 1200,
      keyboard: 'Cherry',
      keyboard_price: 50
    },
    {
      id: 2,
      mouse: 'Lg X200',
      mouse_price: 30,
      cpu: '2.6Ghz',
      cpu_price: 900,
      keyboard: 'Fllor',
      keyboard_price: 900
    },
    {
      id: 3,
      mouse: 'Dell GTR',
      mouse_price: 500,
      cpu: '3.16Ghz',
      cpu_price: 200,
      keyboard: 'Dell Package',
      keyboard_price: 100
    }
  ].map { |data| OpenStruct.new(data) }

  def self.add_get_methods
    Datas.each do |data|
      %i[cpu mouse keyboard].each do |name|
        price = "get_#{name}_price"
        info = "get_#{name}_info"
        data.send("#{price}=", data.send("#{name}_price"))
        data.send("#{info}=", data.send(name))

        def_delegator :@data, price
        def_delegator :@data, info
      end
    end
  end

  Db.add_get_methods

  def initialize(id)
    @data = Datas.find { |pc| pc.id == id }
  end
end
