# Multiple Signatures

# What do each of these puts statements output?

a = %w(a b c d e)

puts a.fetch(7)
#=> IndexError bc "referenced index (7) lies outside the array bounds"
puts a.fetch(7, 'beats me')
#=> 'beats me' bc a second argument/defualt was supplied
puts a.fetch(7) { |index| index**2 }
#=> 49 bc "if a block is given it will only be executed when an invalid index is referenced"