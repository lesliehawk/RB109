# Practice Problem 5
# Given this nested Hash,
# figure out the total age of just the male members of the family.


munsters = {
  "Herman" => { "age" => 32, "gender" => "male" },
  "Lily" => { "age" => 30, "gender" => "female" },
  "Grandpa" => { "age" => 402, "gender" => "male" },
  "Eddie" => { "age" => 10, "gender" => "male" },
  "Marilyn" => { "age" => 23, "gender" => "female"}
}

ages = []

munsters.each { |_, v| ages << v["age"]if v['gender'] == 'male' }

p ages.sum