# const_missing方法是类方法
class MyClass
  def self.const_missing(const_name)
    case const_name
    # 注意，这里const_name的值:SubMyClass用符号表示，
    # const_name中保存的是符号
    when :SubMyClass
      'Sorry wen can not find SubMyClass'
    else
      super
    end
  end
end

# => Sorry wen can not find SubMyClass
puts MyClass::SubMyClass

# => `const_missing': uninitialized constant MyClass::OtherConst (NameError)
puts MyClass::OtherConst