# Write a method that takes two sorted Arrays as arguments, and returns a new Array
# that contains all elements from both arguments in sorted order.

# You may not provide any solution that requires you to sort the result array. You
# must build the result array one element at a time in the proper order.

# Your solution should not mutate the input arrays.

=begin
Problem
Inputs:
- two arrays with their elements sorted in ascending order
Outputs:
- a new array with all elements from both argument arrays, sorted in ascending order
Explicit Rules:
- not allowed to sort the result array
- do not mutate input arrays
Implicit Rules:
Questions?:
----------------------------------------------------------
Examples
----------------------------------------------------------
Data Structure
----------------------------------------------------------
Scratch Pad
- initialize `smallest_num` to nil
----------------------------------------------------------
Algorithm
- initialize index1 to 0
- initialize index2 to 0
- initialize result to an empty array
- initialize a loop:
  - if element from from array1 at index1 < element from array2 at index2, or index1 >=
  array1.size
    - add element from from array1 at index1 to `result`
    - increment index1 by 1
  - otherwise
    - add element from array2 at index2 to `result`
    - increment index2 by 1
  - break if index1 >= array1.size AND index2 >= array2.size
- return `result`
----------------------------------------------------------
=end

def merge(arr1, arr2)
  index1 = 0
  index2 = 0
  result = []

  loop do
    if arr1[index1] == nil
      result << arr2[index2]
      index2 += 1
    elsif arr2[index2] == nil
      result << arr1[index1]
      index1 += 1
    elsif arr1[index1] < arr2[index2]
      result << arr1[index1]
      index1 += 1
    else
      result << arr2[index2]
      index2 += 1
    end

    break if index1 >= arr1.size && index2 >= arr2.size
  end

  result
end

p merge([1, 5, 9], [2, 6, 8]) #== [1, 2, 5, 6, 8, 9]
p merge([1, 1, 3], [2, 2]) #== [1, 1, 2, 2, 3]
p merge([], [1, 4, 5]) #== [1, 4, 5]
p merge([1, 4, 5], []) #== [1, 4, 5]