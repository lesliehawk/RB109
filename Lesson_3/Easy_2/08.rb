# Shorten the following sentence:

# Review the String#slice! documentation,
# and use that method to make the return value
# "Few things in life are as important as ".
# But leave the advice variable as "house training your pet dinosaur.".

advice = "Few things in life are as important as house training your pet dinosaur."

advice.slice!("Few things in life are as important as ")
#=> "Few things in life are as important as "
advice
#=> "house training your pet dinosaur.""

# LS Answer:
advice.slice!(0, advice.index('house'))
# removes string from index 0 to index 39-43 where 'house' is

# As a bonus, what happens if you use the String#slice method instead?
# #slice is not a mutating method so the whole quote remains the value of advice