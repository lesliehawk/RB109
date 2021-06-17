# Practice Problem 14
# Given this data structure write some code to return an array
# containing the colors of the fruits and the sizes of the vegetables.
# The sizes should be uppercase and the colors should be capitalized.

hsh = {
  'grape' => {type: 'fruit', colors: ['red', 'green'], size: 'small'},
  'carrot' => {type: 'vegetable', colors: ['orange'], size: 'medium'},
  'apple' => {type: 'fruit', colors: ['red', 'green'], size: 'medium'},
  'apricot' => {type: 'fruit', colors: ['orange'], size: 'medium'},
  'marrow' => {type: 'vegetable', colors: ['green'], size: 'large'},
}
arr = []
hsh.each_value do |subhsh|
  if subhsh[:type] == 'fruit'
    arr << subhsh[:colors].map { |elem| elem.capitalize }
  else subhsh[:type] == 'vegetable'
    arr << subhsh[:size].upcase
  end
end

# The return value should look like this:

p arr == [["Red", "Green"], "MEDIUM", ["Red", "Green"], ["Orange"], "LARGE"]



