# select the key-value pairs where the value is 'Fruit'

def select_fruit(list)
  list.select { | food, type| list[food] == 'Fruit'}
end


produce = {
  'apple' => 'Fruit',
  'carrot' => 'Vegetable',
  'pear' => 'Fruit',
  'broccoli' => 'Vegetable'
}

p select_fruit(produce) # => {"apple"=>"Fruit", "pear"=>"Fruit"}

