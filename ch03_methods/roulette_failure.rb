class Roulette
  def method_missing(name, *_args)
    person = name.to_s.capitalize
    3.times do
      number = rand(1..10)
      puts number
    end

    # 变量number超出作用域，导致Ruby按number方法查找 ，
    # 起发stack level too deep (SystemStackError)异常
    puts "#{person} got a #{number}"
  end
end

Roulette.new.bob

Roulette.new.tom
