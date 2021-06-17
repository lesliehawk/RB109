# Map out a detailed breakdown for the above example using the same approach
# as the previous two examples.
# What do you think will be returned and what will be the side-effects?
# You shouldn't have to guess; there is a right answer
# and you have all the knowledge necessary to take it apart.
# Take your time and be careful.
# Check the solution below once you have done this on your own.

[[1, 2], [3, 4]].map do |arr|
  puts arr.first
  arr.first
end

# Line  Action            Object            Side Effect      RV                   Is RV Used?
# 9     method call       Outer array       None             New array            No
#       #map                                                 [1, 3]

# 9-12  block execution   Each subarray     None             Int at index 0       Yes used by #map for
#                                                            of subarray          transformation

# 10    method call       Each subarray     None             Elem at index 0      Yes used by #puts
#       #first                                               of subarray

# 10    method call       Int at index 0    Outputs a str    nil                  No
#       #puts             of each subarray  rep of an Int

# 11    method call       Each subarray        None          Element at index 0   Yes used to determine
#       #first                                               of subarray          the RV of block