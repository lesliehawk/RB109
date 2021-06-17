# Mutation
# What will the following code print, and why?
# Don't run the code until you have tried to answer.

array1 = %w(Moe Larry Curly Shemp Harpo Chico Groucho Zeppo)
array2 = []
array1.each { |value| array2 << value }
# populates array2 with references to array1 values
# bc each only deals with the original array, it does not make a new array (like select and map)
array1.each { |value| value.upcase! if value.start_with?('C', 'S') }
# mutates array1 values, which array2 also points to
puts array2
# ["Moe", "Larry", "CURLY", "SHEMP", "Harpo", "CHICO", "Groucho", "Zeppo"]
