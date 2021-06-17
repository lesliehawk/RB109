# Bannerizer
# Write a method that will take a short line of text,
# and print it within a box.

def expand(string, filler)
  pad_str = ''
  counter = 0
  while counter < string.length
    pad_str += filler
    counter += 1
  end
  pad_str
end


def print_in_box(string)
  puts "+-#{expand(string, '-')}-+"
  puts "| #{expand(string, ' ')} |"
  puts "| #{string} |"
  puts "| #{expand(string, ' ')} |"
  puts "+-#{expand(string, '-')}-+"
end

# Example:

print_in_box('To boldly go where no one has gone before.')
# +--------------------------------------------+
# |                                            |
# | To boldly go where no one has gone before. |
# |                                            |
# +--------------------------------------------+

print_in_box('')
# +--+
# |  |
# |  |
# |  |
# +--+
# You may assume that the input will always fit in your terminal window.

# 10:20am - 10:39am (19 min)
