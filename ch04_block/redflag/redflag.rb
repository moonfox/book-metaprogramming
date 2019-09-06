lambda {
  events = []
  setups = []

  define_method :setup do |&setup|
    setups << setup
  end

  define_method :event do |name, &event|
    events << { name: name, event: event }
  end

  define_method :setup_each do |&block|
    setups.each do |setup|
      block.call(setup)
    end
  end

  # 数组中的元素如何执行，怎样执行，交由block（块）中的代码决定
  # 这一点很像[].each {|arg|}方法
  define_method :event_each do |&block|
    events.each do |event|
      block.call(event)
    end
  end
}.call

load File.expand_path("events.rb", File.dirname(__FILE__))

lambda {
  event_each do |event|
    setup_each { |setup| setup.call }
    puts "ALERT: #{event[:name]}" if event[:event].call
  end
}

# 使用洁净室
lambda {
  event_each do |event|
    env = Object.new
    # 不使用BasicObject.new的原因是，它可以调用的方法太少，如它没有puts方法
    # env = BasicObject.new
    setup_each { |setup| env.instance_eval &setup }
    puts "ALERT: #{event[:name]}" if env.instance_eval(&event[:event])
  end
}
