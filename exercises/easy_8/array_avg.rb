# Write a method that takes one argument, an array containing integers, and returns
# the average of all numbers in the array. The array will never be empty and the numbers
# will always be positive integers. Your result should also be an integer.

# Don't use the Array#sum method for your solution - see if you can solve this problem
# using iteration more directly.

=begin
Problem
Inputs:
- a non-empty array containing positive integers
Outputs:
- the average of all numbers in the input array
Explicit Rules:
- the average should be returned as an integer, *not* a float point number
Implicit Rules:
Questions?:
----------------------------------------------------------
Examples
puts average([1, 6]) == 3 # integer division: (1 + 6) / 2 -> 3
puts average([1, 5, 87, 45, 8, 8]) == 25
puts average([9, 47, 23, 95, 16, 52]) == 40
----------------------------------------------------------
Data Structure
----------------------------------------------------------
Scratch Pad
----------------------------------------------------------
Algorithm
- initialize a local variable `sum` and assign it to 0
- iterate through the input array, adding each array element to `sum`
- divide sum by the number of elements in the input array
----------------------------------------------------------
=end

# def average(arr)
#   sum = 0
#   arr.each { |num| sum += num }
#   sum / arr.size
# end

# puts average([1, 6]) == 3 # integer division: (1 + 6) / 2 -> 3
# puts average([1, 5, 87, 45, 8, 8]) == 25
# puts average([9, 47, 23, 95, 16, 52]) == 40
#----------FURTHER EXPLORATION--------------------------
# Currently, the return value of average is an Integer. When dividing numbers, sometimes
# the quotient isn't a whole number, therefore, it might make more sense to return a
# Float. Can you change the return value of average from an Integer to a Float?

def average(arr)
  sum = 0
  arr.each { |num| sum += num }
  sum / arr.size.to_f
end

puts average([1, 6])
puts average([3, 4, 7])