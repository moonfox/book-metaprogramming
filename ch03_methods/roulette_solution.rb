class Roulette
  def method_missing(name)
    person = name.to_s.capitalize

    # tom不在[ Bob Frank Bill ]中，调用超类mehtod_missing方法，
    # 正常截获异常，没有陷入too deep stack
    super unless %w[Bob Frank Bill].include?(person)
    number = 0
    3.times do
      number =  rand(1..10)
      puts number
    end

    # 变量number超出作用域，导致Ruby按number方法查找 ，
    # 起发stack level too deep (SystemStackError)异常
    # puts "#{person} got a #{number}"
  end
end

Roulette.new.bob
Roulette.new.frank

Roulette.new.tom
# => method_missing': undefined method `tom'
