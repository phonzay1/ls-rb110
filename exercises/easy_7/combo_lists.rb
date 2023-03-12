# Write a method that combines two Arrays passed in as arguments, and returns a new
# Array that contains all elements from both Array arguments, with the elements taken
# in alternation.

# You may assume that both input Arrays are non-empty, and that they have the same
# number of elements.

=begin
Problem
Inputs:
- 2 non-empty arrays that each contain the same number of elements
Outputs:
- one array that contains all elements from both input arrays, with the elements
listed in alternating order
Explicit Rules:
Implicit Rules:
Questions?:
----------------------------------------------------------
Examples
interleave([1, 2, 3], ['a', 'b', 'c']) == [1, 'a', 2, 'b', 3, 'c']
----------------------------------------------------------
Data Structure
----------------------------------------------------------
Scratch Pad
----------------------------------------------------------
Algorithm
- initialize a variable `combo_array` and assign it to an empty array
- initialize a variable `index` and assign it to 0
- initialize a loop:
  - break if index == arr1.size
  - add the element from arr1 at index `index` to `combo_array`
  - add the element from arr2 at index `index` to `combo_array`
  - increment `index` by 1
- return `combo_array`
----------------------------------------------------------
=end

# def interleave(arr1, arr2)
#   combo_array = []
#   index = 0

#   loop do
#     break if index == arr1.size
#     combo_array.push(arr1[index], arr2[index])
#     index += 1
#   end

#   combo_array
# end
#----------FURTHER EXPLORATION------------------
def interleave(arr1, arr2)
  arr1.zip(arr2).flatten
end

p interleave([1, 2, 3], ['a', 'b', 'c']) == [1, 'a', 2, 'b', 3, 'c']