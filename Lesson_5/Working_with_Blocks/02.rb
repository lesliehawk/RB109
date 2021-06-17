[[1, 2], [3, 4]].map do |arr|
  puts arr.first
end
# 1
# 3
# => [nil, nil]

# The map method uses the return value of the block to populate the array it returns.
# The return value of the block is nil as a result of puts.
# Therefore the return value of map is [nil, nil].