# Write a method that computes the difference between the square of the sum of the
# first n positive integers and the sum of the squares of the first n positive integers.

=begin
Problem
Inputs:
- a positive integer(n)
Outputs:
- the result of subtracting the sum of the squares of each integer from 1-n, inclusive,
from the result of adding together all integers from 1 - n, inclusive, and squaring that sum
Explicit Rules:
Implicit Rules:
Questions?:
----------------------------------------------------------
Examples
----------------------------------------------------------
Data Structure
----------------------------------------------------------
Scratch Pad
----------------------------------------------------------
Algorithm
- initialize a variable `sum_squared` and assign it to the result of adding together
all integers from 1 - n, and squaring that sum
- initialize a variable `square_sum` to 0
  - iterate through each integer from 1 - n, adding its square to `square_sum`
- return the result of `sum_squared` - `square_sum`
----------------------------------------------------------
=end

def sum_square_difference(integer)
  sum_squared = (1..integer).reduce(:+) ** 2

  square_sum = 0
  (1..integer).each { |int| square_sum += int ** 2 }

  sum_squared - square_sum
end

p sum_square_difference(3) == 22
   # -> (1 + 2 + 3)**2 - (1**2 + 2**2 + 3**2)
p sum_square_difference(10) == 2640
p sum_square_difference(1) == 0
p sum_square_difference(100) == 25164150
p sum_square_difference(5)