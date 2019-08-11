class User
  def name
    "original name"
  end

  def passwd
    "original passwd"
  end
end

module UserModule
  def bio
    'I come from STEAED Planet'
  end
end

module RefineUser
  refine User do
    include UserModule
    
    def name
      "Be refined name"
    end

    def passwd
      "Be refined passwd"
    end

    def age
      20
    end

    # 不能调用include中包含的方法
    def introduce
      "Introduction: #{bio}"
    end
  end
end

class MyClass
  using RefineUser

  def user
    User.new
  end

  def name_with_refine
    User.new.name
  end

  def methods_of_user_refine
    User.instance_methods.grep(:age)
  end

  def introduce
    User.new.introduce
  end
end

lambda {
  # 因为此时的作用域为顶级作用域，所以User类不受refine影响
  puts MyClass.new.user.name
  # => original name

  puts MyClass.new.name_with_refine
  # => Be refined name

  # instance_methods方法不承认refine下创建的方法
  puts MyClass.new.methods_of_user_refine
  # => nil

  # undefined local variable or method `bio'
  puts MyClass.new.introduce
}

lambda {
  module RefineUser
    puts User.new.passwd
    # => original passwd
    refine User do
      def passwd
        "222"
      end

      puts User.new.passwd
      # => 222
    end
    puts User.new.passwd
    # => original passwd
  end
}