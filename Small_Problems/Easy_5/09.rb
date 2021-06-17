# ddaaiillyy ddoouubbllee
# Write a method that takes a string argument
# and returns a new string that contains
# the value of the original string with all consecutive duplicate characters
# collapsed into a single character.

# You may not use String#squeeze or String#squeeze!.

# def crunch(string)
#   p string.split(' ').map { |word| word.chars.uniq.join}.join(' ')
# end

def crunch(string)
  new_arr = []
  string.split.each do |word|
    word.chars.each_with_index do |chr, idx|
      new_arr << chr unless string[idx] == string[idx + 1]
    end
    new_arr << ' '
  end
  crunched_string = new_arr.join.chomp(' ')
end

p crunch('ddaaiillyy ddoouubbllee') == 'daily double'
p crunch('4444abcabccba') == '4abcabcba'
p crunch('ggggggggggggggg') == 'g'
p crunch('a') == 'a'
p crunch('') == ''

# 10:01am - 10:19am (18 min)