# Let's do some "ASCII Art" (a stone-age form of nerd artwork
# from back in the days before computers had video screens).

# For this practice problem, write a one-line program that creates
# the following output 10 times, with the subsequent line indented 1 space to the right:

# The Flintstones Rock!
#  The Flintstones Rock!
#   The Flintstones Rock!

statement = "The Flintstones Rock!"
counter = 0

until counter == 10
  puts statement.prepend(' ')
  counter += 1
end

10.times { puts "The Flintstones Rock!".prepend(' ')} # nope

10.times { puts "The Flintstones Rock!".insert(0, ' ')} # nope

# LS One-Line Answer:

10.times { |count| puts (" " * count) + "The Flintstones Rock!" }
              #0                 #0 spaces
              #1                 #1 space...
              #9                 #9 spaces END