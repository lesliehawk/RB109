# In this hash of people and their age, see if "Spot" is present.
# Bonus: What are two other hash methods that would work just as well for this solution?

ages = { "Herman" => 32, "Lily" => 30, "Grandpa" => 402, "Eddie" => 10 }

ages.include?("Spot") #=> false
ages["Spot"] #=> nil bc not present in hash
ages.fetch["Spot"] #=> KeyError: (key not found: "Spot")
ages.has_key?("Spot") #=> false
# LS Additional Answers:
ages.key?("Spot") #=> false
ages.member?("Spot") #=> false
