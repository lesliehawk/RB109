# Staggered Caps (Part 1)
# Write a method that takes a String as an argument,
# and returns a new String that contains the original value
# using a staggered capitalization scheme
# in which every other character is capitalized,
# and the remaining characters are lowercase.
# Characters that are not letters should not be changed,
# but count as characters when switching between upper and lowercase.

def staggered_case(str)
  arr = str.downcase.chars
  idx = 0
  until idx >= arr.length
    idx.even? ? arr[idx] = arr[idx].upcase : arr[idx]
    idx += 1
  end
  arr.join
end

# LS ANSWER:
# def staggered_case(string)
#   result = ''                 # builds new string rather than modifying arr
#   need_upper = true
#   string.chars.each do |char|
#     if need_upper
#       result += char.upcase
#     else
#       result += char.downcase
#     end
#     need_upper = !need_upper  # toggles need_upper from true to false
#   end
#   result
# end

# Further Exploration, student answer:
# def staggered_case(string, starter = true)
#   string.chars.each do |char|
#     starter ? char.upcase! : char.downcase!
#     starter = !starter
#   end.join
# end

p staggered_case('I Love Launch School!') == 'I LoVe lAuNcH ScHoOl!'
p staggered_case('ALL_CAPS') == 'AlL_CaPs'
p staggered_case('ignore 77 the 444 numbers') == 'IgNoRe 77 ThE 444 NuMbErS'