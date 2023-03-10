# Write a method that takes an Array as an argument, and reverses its elements in
# place; that is, mutate the Array passed into this method. The return value should
# be the same Array object.

# You may not use Array#reverse or Array#reverse!.

=begin
Problem
Inputs:
- an array
Outputs:
- the original input array (mutated), with its elements reversed
Explicit Rules:
- the object_id of the input array should be the same as the array returned by the
method
Implicit Rules:
- an empty array should return an empty array
Questions?:
----------------------------------------------------------
Examples
list = [1,2,3,4]
result = reverse!(list)
result == [4, 3, 2, 1] # true
list == [4, 3, 2, 1] # true
list.object_id == result.object_id # true

list = %w(a b e d c)
reverse!(list) == ["c", "d", "e", "b", "a"] # true
list == ["c", "d", "e", "b", "a"] # true

list = ['abc']
reverse!(list) == ["abc"] # true
list == ["abc"] # true

list = []
reverse!(list) == [] # true
list == [] # true
----------------------------------------------------------
Data Structure
----------------------------------------------------------
Scratch Pad
- switch array[0] with array[-1], array[1] with array[-2], array[2] with array[-3], etc
until index_1 == array.size
----------------------------------------------------------
Algorithm
- initialize a variable `first_index` and assign it to 0
- initialize a variable `second_index` and assign it to -1
- create a loop:
  - break if `first_index` == the size of the input array divided by 2
  - use indexed assignment to swap the element at index `first_index` in the input
  array with the element at index `second_index` in the input array
  - increment `first_index` by 1
  - decrement `second_index` by 1
- return the input array
----------------------------------------------------------
=end

def reverse_array!(arr)
  first_index = 0
  second_index = -1

  loop do
    break if first_index == arr.size / 2
    arr[first_index], arr[second_index] = arr[second_index], arr[first_index]
    first_index += 1
    second_index -= 1
  end

  arr
end

list1 = [1,2,3,4]
result = reverse_array!(list1)
p result
p list1
p list1.object_id == result.object_id

list2 = %w(a b e d c)
p reverse_array!(list2) == ["c", "d", "e", "b", "a"] # true
p list2
p list2 == ["c", "d", "e", "b", "a"] # true

list3 = ['abc']
p reverse_array!(list3) == ["abc"] # true
p list3 == ["abc"] # true

list4 = []
p reverse_array!(list4) == [] # true
p list4 == [] # true

list5 = [1, 3, 5, 7, 9]
reversed = reverse_array!(list5)
p reversed
p list5
p list5.object_id
p reversed.object_id