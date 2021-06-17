# Create a hash that expresses the frequency with which
# each letter occurs in this string:

# Ex: { "F"=>1, "R"=>1, "T"=>1, "c"=>1, "e"=>2, ... }

statement = "The Flintstones Rock"
hash = {}
letters = statement.split.join

letters.chars.each do |chr|
  hash[chr] = statement.count(chr)
end

hash
#=> {"T"=>1, "h"=>1, "e"=>2, "F"=>1, "l"=>1, "i"=>1, "n"=>2, "t"=>2, "s"=>2, "o"=>2, "R"=>1, "c"=>1, "k"=>1}