# Remove people with age 100 and greater.

ages = { "Herman" => 32, "Lily" => 30, "Grandpa" => 402, "Eddie" => 10 }

ages.each { |(key, value)| ages.delete(key) if value >= 100 }

# LS Answer:

ages.keep_if { |_, age| age < 100 }