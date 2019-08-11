class Order
  def num_no
    "original order id"
  end

  def addr
    "original order addr"
  end
end

module OrderExtension
  refine Order do
    def amount
      10
    end

    def addr
      "refined order addr"
    end
  end
end

class Order
  using OrderExtension

  def info
    "order_info::::addr:#{addr}, num_no:#{num_no}, amount:#{amount}"
  end
end

class Order
  def print_order
    "print_order::::addr:#{addr}, num_no:#{num_no}, amount:#{amount}"
  end
end

order = Order.new

puts order.info
# => order_info::::addr:refined order_addr, num_no:original order_id, amount:10

puts order.print_order
# => undefined local variable or method `amount' for
# 因为最后一次打开Order类时，没有引入using OrderExtension所以print_order方法内看不
# 到由细化添的方法，也说明了细化的范围在定义有using OrderExtension的Order类中有效,
# 不会影响/改变其它地方的Order的类定义
