def count_occurrences(arr)
  count = Hash.new(0)
  arr.each { |word| count[word.downcase] += 1 }
  count.each { |k, v| puts "#{k} => #{v}" }
end

vehicles = [
  'car', 'car', 'truck', 'car', 'SUV', 'truck',
  'motorcycle', 'motorcycle', 'car', 'truck', 'suv'
]

count_occurrences(vehicles)