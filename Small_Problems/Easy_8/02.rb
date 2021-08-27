# Madlibs
# Mad libs are a simple game where you create a story template
# with blanks for words.
# You, or another player, then construct a list of words
# and place them into the story, creating an often silly
# or funny story as a result.

# Create a simple mad-lib program
# that prompts for a noun, a verb, an adverb, and an adjective
# and injects those into a story that you create.

puts "* Welcome to Madlibs! *"
puts
puts "Enter a noun (person, place or thing):"
noun = gets.chomp
puts "Enter a verb (action, state, or occurrence):"
verb = gets.chomp
puts "Enter a adjective (attribute):"
adjective = gets.chomp
puts "Enter a adverb (describes a verb, ie sings loudly (verb, adverb):"
adverb = gets.chomp

puts "Please #{verb} a #{adjective} #{noun} #{adverb}. Thank you."

# Enter a noun: dog
# Enter a verb: walk
# Enter an adjective: blue
# Enter an adverb: quickly

# Do you walk your blue dog quickly? That's hilarious!

# Luke Carlson's great answer:

# words = {noun: '', verb: '', adjective: '', adverb: ''}

# words.each_key do |key|
#   puts ">> #{key} please: "
#   words[key] = gets.chomp
# end

# puts "The #{words[:noun]} likes to #{words[:verb]} "\
# "#{words[:adverb]} in the #{words[:adjective]} moonlight."