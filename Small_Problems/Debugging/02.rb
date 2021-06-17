# HEY YOU!
# String#upcase! is a destructive method,
# so why does this code print HEY you instead of HEY YOU?
# Modify the code so that it produces the expected output.

def shout_out_to(name)
  # name.chars.each { |c| c.upcase! }
  name = name.chars.each { |c| c.upcase! }.join
  puts 'HEY ' + name
end

shout_out_to('you') # expected: 'HEY YOU'

# each is returning the original array (name.chars),
# which has been mutated by the upcase! call on each char. ['Y', 'O', 'U']
# However name string variable has not been changed.
# Concatenating "HEY" + name results in HEY you, as name has not been mutated.
# To get the result, HEY YOU, ['Y', 'O', 'U'].join must be called to convert the array to a string
# Then that string can be reassigned to name, and called to concatenate with HEY.

# OR to simplify like LS: just name.upcase! will do the trick.