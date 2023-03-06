# Write a method that takes an Array of numbers, and returns an Array with the same
# number of elements, and each element has the running total from the original Array.

# A running total is the sum of all values in a list up to and including the current
# element. Thus, the running total when looking at index 2 of the array [14, 11, 7, 15, 20]
# is 32 (14 + 11 + 7), while the running total at index 3 is 47 (14 + 11 + 7 + 15).

=begin
Problem
Inputs:
- an array of numbers
Outputs:
- an array with the same number of elements as the input array, where each element
is the running total from the original array
Explicit Rules:
- running totals include all values from a list up to and including the current value
Implicit Rules:
- an empty array should return an empty array
Questions?:
- does it matter if we create a new array, or mutate the original array?
----------------------------------------------------------
Examples
running_total([2, 5, 13]) == [2, 7, 20]
running_total([14, 11, 7, 15, 20]) == [14, 25, 32, 47, 67]
running_total([3]) == [3]
running_total([]) == []
----------------------------------------------------------
Data Structure
----------------------------------------------------------
Scratch Pad
- use map for transformation
----------------------------------------------------------
Algorithm
- Initialize a variable, current_sum, to hold the current running total
- Iterate over each element in the input array, adding its value to the running
total, and adding that new running total to a new array
- return the new array with the running totals
----------------------------------------------------------
=end

# def running_total(arr)
#   current_sum = 0
#   arr.map {|num| current_sum += num}
# end

# --------------------------------------------
# FURTHER EXPLORATION
# Try solving this problem using Enumerable#each_with_object or Enumerable#inject
# (note that Enumerable methods can be applied to Arrays).

# def running_total(arr)
#   current_sum = 0
#   arr.each_with_object([]) do |num, array_of_sums|
#     current_sum += num
#     array_of_sums << current_sum
#   end
# end
#----
def running_total(arr)
  array_of_sums = []
  arr.each_with_index do |num, idx|
    array_of_sums << arr[0..idx].inject(:+)
  end
  array_of_sums
end

p running_total([2, 5, 13]) == [2, 7, 20]
p running_total([14, 11, 7, 15, 20]) == [14, 25, 32, 47, 67]
p running_total([3]) == [3]
p running_total([]) == []