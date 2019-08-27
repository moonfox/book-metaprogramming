class MyScope
  def self.share_var
    share = 0

    define_method :counter do
      share
    end

    define_method :inc do |num|
      share += num
    end
  end

  share_var

  def access_var?
    begin
      share
      true
    rescue => exception
      false
    end
  end
end

obj = MyScope.new
puts obj.counter # => 0
puts obj.inc(4) # => 4
puts obj.counter # => 4
puts obj.access_var? # => false