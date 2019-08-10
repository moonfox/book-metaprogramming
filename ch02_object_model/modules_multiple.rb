module M1; end

# 这里会产生一条祖先链,记为Chain_01: M2 < M1
module M2
  include M1
end

# 这里会产生一条祖先链,记为Chain_02: [M1, M3, M2]
# 这条祖先链与Chain_01没有关系
module M3
  prepend M1
  include M2
end

# 执行过程：
# M3执行prepend，插入M1到祖先链下方: M1 < M3
# 再执行include，插入M2到祖先链上方: M1 < M3 < M2
# 此时程序进入M2, 执行include M1，但此时M1已经出现在这条祖先链中，
# 所以不在执行include M1，最终的祖先链是 [M1, M3, M2]

# 一个模块只能在一个祖先链中出现一次

p M3.ancestors
# => [M1, M3, M2]
