# Write a method that takes two Array arguments in which each Array contains a list
# of numbers, and returns a new Array that contains the product of every pair of
# numbers that can be formed between the elements of the two Arrays. The results
# should be sorted by increasing value.

# You may assume that neither argument is an empty Array.

=begin
Problem
Inputs:
- two arrays that each contain a list of numbers
Outputs:
- a new array that contains the product of every pair of numbers that can be formed
between the elements of the two input arrays, listed by increasing value
Explicit Rules:
- assume that neither input array is empty
Implicit Rules:
Questions?:
----------------------------------------------------------
Examples
multiply_all_pairs([2, 4], [4, 3, 1, 2]) == [2, 4, 4, 6, 8, 8, 12, 16]
----------------------------------------------------------
Data Structure
----------------------------------------------------------
Scratch Pad
- Array#product
----------------------------------------------------------
Algorithm
- create an array with nested arrays that each contain a pair of numbers: each
possible pair of numbers that can be formed between the elements of the two input arrays
- transform each subarray element of this array to the result of multiplying its
two elements
- sort the array from lowest to highest value
----------------------------------------------------------
=end

def multiply_all_pairs(arr1, arr2)
  arr1.product(arr2).map {|subarr| subarr[0] * subarr[1]}.sort
end

p multiply_all_pairs([2, 4], [4, 3, 1, 2]) == [2, 4, 4, 6, 8, 8, 12, 16]