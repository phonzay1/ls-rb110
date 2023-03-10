# Write a method named include? that takes an Array and a search value as arguments.
# This method should return true if the search value is in the array, false if it is not.
# You may not use the Array#include? method in your solution.

=begin
Problem
Inputs:
- an array and a value to search for within the array
Outputs:
- a boolean: true if the search value is in the array, false if not
Explicit Rules:
- don't use Array#include?
Implicit Rules:
Questions?:
----------------------------------------------------------
Examples
include?([1,2,3,4,5], 3) == true
include?([1,2,3,4,5], 6) == false
include?([], 3) == false
include?([nil], nil) == true
include?([], nil) == false
----------------------------------------------------------
Data Structure
----------------------------------------------------------
Scratch Pad
----------------------------------------------------------
Algorithm
- iterate through each item in the input array, comparing it to the search value
  - if an input array element is found that == the search value, return true
- otherwise, return false
----------------------------------------------------------
=end

def include?(arr, search_value)
  arr.each { |el| return true if el == search_value }
  false
end

p include?([1,2,3,4,5], 3) == true
p include?([1,2,3,4,5], 6) == false
p include?([], 3) == false
p include?([nil], nil) == true
p include?([], nil) == false
