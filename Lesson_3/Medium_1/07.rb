# One day Spot was playing with the Munster family's home computer
# and he wrote a small program to mess with their demographic data:


munsters = {
  "Herman" => { "age" => 32, "gender" => "male" },
  "Lily" => { "age" => 30, "gender" => "female" },
  "Grandpa" => { "age" => 402, "gender" => "male" },
  "Eddie" => { "age" => 10, "gender" => "male" },
  "Marilyn" => { "age" => 23, "gender" => "female"}
}

def mess_with_demographics(demo_hash)
  demo_hash.values.each do |family_member|
    family_member["age"] += 42
    family_member["gender"] = "other"
  end
end

# After writing this method, he typed the following...
# and before Grandpa could stop him, he hit the Enter key with his tail:

mess_with_demographics(munsters)

# Did the family's data get ransacked? Why or why not?
# Yes, it did. The key[value] += method is mutating
# and therefore does affect the hash passed into the method.
# Vesus += or = which is reassignement (non-mutating) and would not have changed the original hash.
