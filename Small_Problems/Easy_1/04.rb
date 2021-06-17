# How Many?

# Write a method that counts the number of occurrences of
# each element in a given array.

# The words in the array are case-senstive: 'suv' != 'SUV'.
# Once counted, print each element alongside the number
# of occurrences.

def count_occurrences(array)
  unique_arr = array.uniq   # ["car", "truck", "SUV", "motorcycle", "suv"]
  count_hash = Hash.new      # {}

  unique_arr.each do |elem|
    count_hash[elem] = 0      # count_hash = {"car"=>0, "truck"=>0, "SUV"=>0, "motorcycle"=>0, "suv"=>0}
  end

  array.each do |elem|
    if unique_arr.include?(elem)
      count_hash[elem] += 1
    end
  end

  count_hash.each { |k, v| puts "#{k} => #{v}" }

end

# Refactored:

# def count_occurrences(arr)
#   count = Hash.new(0)
#   arr.each { |word| count[word.downcase] += 1 }
#   count.each { |k, v| puts "#{k} => #{v}" }
# end

vehicles = [
  'car', 'car', 'truck', 'car', 'SUV', 'truck',
  'motorcycle', 'motorcycle', 'car', 'truck', 'suv'
]

count_occurrences(vehicles)

# Expected Output: hash

# car => 4
# truck => 3
# SUV => 1
# motorcycle => 2
