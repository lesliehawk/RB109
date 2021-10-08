# PEDAC
=begin
P

For 'x', determine how many positive integers <= 'x' are odd, but not prime
Assume 'x' is an integer between 1 and 10_000.

E

5 has 3 odd numbers (1, 3, 5)
and only the number 1 is not prime, so the answer is 1.

10 has 5 odd numbers (1, 3, 5, 7, 9)
and only 1 and 9 are not prime so the answer is 2.

A prime number is a natural number greater than 1
that has no positive divisors other than 1 and itself.

p odd_not_prime(15) == 3 odd numbers that are not prime
p odd_not_prime(48) == 10
p odd_not_prime(82) == 20

inputs ==> integer
output ==>
return ==> integer
mutation? ==>

D

array of integers (0..num)

A

define method 'prime?' with one parameter ('number')
  if number is greater than 1
  AND
  has no positive divisors other than 1 and itself
    that is:
      when modulo is called on 'number' with 1 passed in as an argument
        the return value is equal to 0 (no remainder)
      AND
      when modulo is called on 'number' with (2..9) iteratively passed in as an argument
        the return value for only one iteration (number % number) is equal to 0

        define a helper method called 'div_only_by_itself?' with one parameter('num'):

        initialize variable count to Integer 0
        loop over range (2..number) <== i
          count += 1 if number % i == 0
          break if count > 1
        end

        count > 1 ? false : true

        # The above resulted in the code below
        # which I refactored further into the actual code
        # using #select instead of #each

          # count = 0
          # (2..num).each do |i|
          #   count += 1 if num % i == 0
          #   return false if count > 1
          # end
          # return true

    RETURN true
  else
    RETURN false
  end


define a method 'odd_not_prime' with one parameter 'number'

within the method:

create an array of odd numbers from 0 to integer:
  initialize 'odd_arr' variable to an empty array object
  initialize a range literal (1..integer)
  loop over the range literal to iterate thru the range one integer at a time
  for each integer
    if integer is odd
      add that integer to 'odd_arr'
    else
      next integer
    end
  return the 'odd_arr' with the selected (odd) integers


select from the odd array all the not prime numbers:
  initialize a variable 'non_prime_arr' to an empty array object
  loop over the 'odd_arr' of odd numbers
    for each integer
      pass integer as argument to 'prime?' helper method
      if return of 'prime?' method is false (integer is not a prime number)
       add that integer to 'non_prime_arr'
      else
        next integer
      end
  end

count the number of elements in the odd but not prime array:
  initalize 'final_arr' to empty array object
  initalize variable 'count' to Integer 0 object
  loop thru the 'non_prime_arr' array
    for 'non_prime_arr' at index 'count'
      return element at index 'count' and append to final_arr
    increment 'count' by 1
    break if 'non_prime_arr' at index 'count' returns nil
  end
  return 'count' as the number of odd non_prime numbers in the original array

C
=end

def prime?(num)
  (num > 1) && ((num % 1 == 0) && div_by_only_itself?(num))
end

def div_by_only_itself?(num)
#refactored:
  arr = (2..num).select { |i| num % i == 0 }
  arr.size <= 1 ? true : false
end

def odd_not_prime(number)
  odd_arr = (1..number).select { |num| num.odd?}
  not_primes = odd_arr.select { |num| !prime?(num) }
  not_primes.size
end

p odd_not_prime(15) #== 3
p odd_not_prime(48) #== 10
p odd_not_prime(82) #== 20




