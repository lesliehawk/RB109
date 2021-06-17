# Rails method titleize creates a string that has each word capitalized
# as it would be in a title. For example, the string:

words = "the flintstones rock"

# would be:

# words = "The Flintstones Rock"

# Write your own version of the rails titleize implementation.

p title = words.split.map { |word| word.capitalize }.join(" ")

p words