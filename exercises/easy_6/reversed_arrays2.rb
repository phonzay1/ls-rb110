# Write a method that takes an Array, and returns a new Array with the elements of
# the original list in reverse order. Do not modify the original list.

# You may not use Array#reverse or Array#reverse!, nor may you use the method you
# wrote in the previous exercise.

=begin
Problem
Inputs:
- an array
Outputs:
- a *new* array with the elements of the original array, but in reverse order
Explicit Rules:
Implicit Rules:
- an empty array returns an empty array
Questions?:
----------------------------------------------------------
Examples
reverse([1,2,3,4]) == [4,3,2,1]          # => true
reverse(%w(a b e d c)) == %w(c d e b a)  # => true
reverse(['abc']) == ['abc']              # => true
reverse([]) == []                        # => true

list = [1, 3, 2]                      # => [1, 3, 2]
new_list = reverse(list)              # => [2, 3, 1]
list.object_id != new_list.object_id  # => true
list == [1, 3, 2]                     # => true
new_list == [2, 3, 1]                 # => true
----------------------------------------------------------
Data Structure
----------------------------------------------------------
Scratch Pad
----------------------------------------------------------
Algorithm
- initialize a variable `reversed_array` and assign it to an empty array
- Create a loop:
  - add each element from the original array to `reverse_array`, starting with
  the last element of the original array and working towards the start of the
  original array
- return `reverse_array`
----------------------------------------------------------
=end

# def reverse_arr(arr)
#   reversed_array = []

#   index = 1
#   until index > arr.size
#     reversed_array << arr[-index]
#     index += 1
#   end

#   reversed_array
# end
#-------------FURTHER EXPLORATION-----------------
def reverse_arr(arr)
 arr.each_with_object([]) {|el, array| array.unshift(el)}
end

p reverse_arr(%w(x y z))
p reverse_arr([1,2,3,4]) == [4,3,2,1]          # => true
p reverse_arr(%w(a b e d c)) == %w(c d e b a)  # => true
p reverse_arr(['abc']) == ['abc']              # => true
p reverse_arr([]) == []                        # => true

list = [1, 3, 2]                      # => [1, 3, 2]
new_list = reverse_arr(list)              # => [2, 3, 1]
p list.object_id != new_list.object_id  # => true
p list == [1, 3, 2]                     # => true
p new_list == [2, 3, 1]                 # => true