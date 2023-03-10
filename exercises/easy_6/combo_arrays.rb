# Write a method that takes two Arrays as arguments, and returns an Array that contains
# all of the values from the argument Arrays. There should be no duplication of values
# in the returned Array, even if there are duplicates in the original Arrays.

=begin
Problem
Inputs:
- two arrays
Outputs:
- one array that contains all of the values from the input arrays, but with no
duplicates
Explicit Rules:
Implicit Rules:
Questions?:
- does the order of values in the returned array matter? Order matters in arrays, and
the method below will get a result that matches the example, but it's hard to know
*exact* rules with just one example
----------------------------------------------------------
Examples
merge([1, 3, 5], [3, 6, 9]) == [1, 3, 5, 6, 9]
----------------------------------------------------------
Data Structure
----------------------------------------------------------
Scratch Pad
----------------------------------------------------------
Algorithm
- initialize a variable `merged_arrs` and assign it to an empty array
- add the elements from each input array to `merged_arrs`
- remove duplicate values from `merged_arrs`
- return `merged_arrs`
----------------------------------------------------------
=end

def merge(arr1, arr2)
  merged_arrs = []
  arr1.each {|el| merged_arrs << el}
  arr2.each {|el| merged_arrs << el}
  merged_arrs.uniq!
  merged_arrs
end

p merge([1, 3, 5], [3, 6, 9]) == [1, 3, 5, 6, 9]