# Create a method that takes two integers as arguments. The first argument is a count,
# and the second is the first number of a sequence that your method will create.
# The method should return an Array that contains the same number of elements as
# the count argument, while the values of each element will be multiples of the starting number.

# You may assume that the count argument will always have a value of 0 or greater,
# while the starting number can be any integer value. If the count is 0, an empty
# list should be returned.

=begin
Problem
Inputs:
- two integers: the first is a count, and the second is a starting point for a sequence
Outputs:
- an array with the same number of elements as the count argument, and values of each
array element are multiples of the starting point number
Explicit Rules:
- count argument will always be >= 0
- starting number can be any integer (positive or negative)
- if the count argument is 0, return an empty array
Implicit Rules:
Questions?:
----------------------------------------------------------
Examples
sequence(5, 1) == [1, 2, 3, 4, 5]
sequence(4, -7) == [-7, -14, -21, -28]
sequence(3, 0) == [0, 0, 0]
sequence(0, 1000000) == []
----------------------------------------------------------
Data Structure
----------------------------------------------------------
Scratch Pad
- Integer#upto or Integer#times
----------------------------------------------------------
Algorithm
- initialize a local variable `multiples` and assign it to an empty array
- iterate over a range of numbers from 1 up to the `count` argument:
  - for each number, multiply the starting point argument by that number, and add
  the product to `multiples`
- return `multiples`
----------------------------------------------------------
=end

def sequence(count, start_num)
  multiples = []
  1.upto(count) { |num| multiples << (start_num * num) }
  multiples
end

p sequence(5, 1) == [1, 2, 3, 4, 5]
p sequence(4, -7) == [-7, -14, -21, -28]
p sequence(3, 0) == [0, 0, 0]
p sequence(0, 1000000) == []