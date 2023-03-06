# Write a method that searches for all multiples of 3 or 5 that lie between 1 and
# some other number, and then computes the sum of those multiples. For instance, if
# the supplied number is 20, the result should be 98 (3 + 5 + 6 + 9 + 10 + 12 + 15 + 18 + 20).

# You may assume that the number passed in is an integer greater than 1.

=begin
Problem
Inputs:
- an integer greater than 1
Outputs:
- the sum of all multiples of 3 or 5 in between 1 and the input integer
Explicit Rules:
Implicit Rules:
- the input integer itself should be considered part of the range
Questions?:
- can I assume that the result of inputting 2 would be 0?
----------------------------------------------------------
Examples
multisum(3) == 3
multisum(5) == 8
multisum(10) == 33
multisum(1000) == 234168
----------------------------------------------------------
Data Structure
- iterate over a range to find the multiples?
- use an array to hold all of the multiples?
----------------------------------------------------------
Scratch Pad
- use a range to create array with all numbers in the range
- create empty array
- iterate over array with all numbers, adding multiples of 3 or 5 to empty array
- use Array#reduce to sum multiples array
----------------------------------------------------------
Algorithm
- Create an array (`numbers`) containing all of the numbers between 1 and the input integer,
including the input integer
- Create an array, `multiples`, containing one element: 0
- Iterate over `numbers`, adding any multiples of 3 or 5 in `numbers` to the `multiples` array
- Sum all of the elements in the `multiples` array
----------------------------------------------------------
=end

# def multisum(number)
#   numbers = (1..number).to_a
#   multiples = [0]

#   numbers.each do |num|
#     multiples << num if num % 3 == 0 || num % 5 == 0
#   end

#   multiples.reduce(:+)
# end
# ----alternatively------
def multisum(number)
  sum = 0

  (1..number).each do |num|
    sum += num if num % 3 == 0 || num % 5 == 0
  end

  sum
end

p multisum(3) == 3
p multisum(5) == 8
p multisum(10) == 33
p multisum(1000) == 234168
p multisum(2)