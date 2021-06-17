# See if the name "Dino" appears in the string below:

advice = "Few things in life are as important as house training your pet dinosaur."

advice.include?('dino')
#=> true

# LS Answer:
advice.match?('Dino')