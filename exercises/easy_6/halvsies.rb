# Write a method that takes an Array as an argument, and returns two Arrays (as a
# pair of nested Arrays) that contain the first half and second half of the original
# Array, respectively. If the original array contains an odd number of elements,
# the middle element should be placed in the first half Array.

=begin
Problem
Inputs:
- an array
Outputs:
- a pair of nested arrays, where the first array contains the first half of the original
array (including the middle element, if the original array had an odd # of elements),
and the second array contains the second half of the original array
Explicit Rules:
Implicit Rules:
- maintain the original order of elements
- two nested arrays should always be returned: an empty array should return two
nested empty arrays
Questions?:
----------------------------------------------------------
Examples
halvsies([1, 2, 3, 4]) == [[1, 2], [3, 4]]
halvsies([1, 5, 2, 4, 3]) == [[1, 5, 2], [4, 3]]
halvsies([5]) == [[5], []]
halvsies([]) == [[], []]
----------------------------------------------------------
Data Structure
----------------------------------------------------------
Scratch Pad
----------------------------------------------------------
Algorithm
- initialize a variable `halved_array` and assign it to a set of two nested empty
arrays: [[], []]
- if the number of elements in the input array is odd:
  - add elements from the input array to the first array in `halved_array` (halved_array[0]),
  until you reach the element from the input array at index (size of the input array / 2)
  - add the rest of the elements from the input array to the second array in `halved_array`
  (add elements starting from index (size of input array/2 + 1))
- otherwise
  - add elements from the input array to the first array in `halved_array` until you
  reach the element from the input array at index (size of input array / 2) - 1
  - add the rest of the elements from the input array to the second array in `halved_array`
  (add elements starting from index (size of input array / 2))
- return `halved_array`
----------------------------------------------------------
=end

def halvsies(arr)
  halved_array = [[],[]]
  if arr.size.odd?
    arr.each_with_index do |el, idx|
      idx <= arr.size/2 ? halved_array[0] << el : halved_array[1] << el
    end
  else
    arr.each_with_index do |el, idx|
      idx <= arr.size/2 - 1 ? halved_array[0] << el : halved_array[1] << el
    end
  end
  halved_array
end

p halvsies([1, 2, 3, 4]) == [[1, 2], [3, 4]]
p halvsies([1, 5, 2, 4, 3]) == [[1, 5, 2], [4, 3]]
p halvsies([5]) == [[5], []]
p halvsies([]) == [[], []]
#------------FURTHER EXPLORATION-------------------
# Can you explain why our solution divides array.size by 2.0 instead of just 2?
# This is done to account for odd numbers, since dividing by 2 would return just the quotient
# result of integer division (i.e. 5 / 2 would return 2). Then when calling #ceil,
# you wouldn't get a number that includes the middle array element in the first half
# (i.e. 2.ceil returns 2). By using float point division, the #ceil call returns a
# number that includes the middle element in the first half, for arrays with an odd number
# of elements (i.e. 5/2.0 returns 2.5, then 2.5.ceil returns 3, so the first 3 elements
# from an array with 5 elements are included in the first half)