# Swap Case
# Write a method that takes a string as an argument
# and returns a new string in which every uppercase letter
# is replaced by its lowercase version,
# and every lowercase letter by its uppercase version.
# All other characters should be unchanged.

# You may not use String#swapcase; write your own version of this method.

UPPERCASE = ('A'..'Z').to_a
LOWERCASE = ('a'..'z').to_a

def swapcase(str)
  swapped_arr = str.chars.map do |chr|
    if UPPERCASE.include?(chr)
      chr.downcase
    elsif LOWERCASE.include?(chr)
      chr.upcase
    else
      chr
    end
  end
  swapped_arr.join
end

# LS Answer:

# def swapcase(string)
#   characters = string.chars.map do |char|
#     if char =~ /[a-z]/
#       char.upcase
#     elsif char =~ /[A-Z]/
#       char.downcase
#     else
#       char
#     end
#   end
#   characters.join
# end

# Student Answer:

# def swapcase(string)
#   string.each_char.map do |char|
#     case char
#     when 'A'..'Z'
#       char.downcase
#     when 'a'..'z'
#       char.upcase
#     else
#       char
#     end
#   end.join
# end

p swapcase('CamelCase') == 'cAMELcASE'
p swapcase('Tonight on XYZ-TV') == 'tONIGHT ON xyz-tv'