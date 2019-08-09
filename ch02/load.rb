class MyClass
  def clean_dirty
    puts "finish dirty have done"
  end
end

class Car
  def initialize(mode)
    @mode = mode
  end

  def engine_start
    puts "#{@mode} du du du..."
  end
end

MyClass.new.clean_dirty
Car.new("Audi Q3").engine_start