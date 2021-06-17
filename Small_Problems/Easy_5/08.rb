# Alphabetical Numbers
# Write a method that takes an Array of Integers between 0 and 19,
# and returns an Array of those Integers sorted
# based on the English words for each number:

# zero, one, two, three, four, five, six, seven, eight, nine, ten, eleven, twelve, thirteen, fourteen, fifteen, sixteen, seventeen, eighteen, nineteen

NUM_HASH = {"zero"=>0, "one"=>1, "two"=>2, "three"=>3, "four"=>4,
            "five"=>5, "six"=>6, "seven"=>7, "eight"=>8, "nine"=>9,
            "ten"=>10, "eleven"=>11, "twelve"=>12, "thirteen"=>13,
            "fourteen"=>14, "fifteen"=>15, "sixteen"=>16, "seventeen"=>17,
            "eighteen"=>18, "nineteen"=>19
           }

def alphabetic_number_sort(digits_arr)
  words_arr = digits_arr.map { |num| NUM_HASH.key(num) }.sort
  words_arr.map { |word| NUM_HASH.values_at(word)}.flatten
end

# LS ANSWER:

NUMBER_WORDS = %w(zero one two three four
                  five six seven eight nine
                  ten eleven twelve thirteen fourteen
                  fifteen sixteen seventeen eighteen nineteen)

def alphabetic_number_sort(numbers)
  numbers.sort_by { |number| NUMBER_WORDS[number] }
  # so I brute forced #sort_by with a hash
end

# Examples:

p alphabetic_number_sort((0..19).to_a) == [
  8, 18, 11, 15, 5, 4, 14, 9, 19, 1, 7, 17,
  6, 16, 10, 13, 3, 12, 2, 0
]

# 7:07pm - 7:30pm (23 min)