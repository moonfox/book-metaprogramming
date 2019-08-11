module StringExtensions
  refine String do
    def reverse
      'serever'
    end
  end
end

puts 'hello'.reverse
# => olleh

# 使用细化,作为范围直到文件尾
using StringExtensions

puts 'hello'.reverse
# => serever