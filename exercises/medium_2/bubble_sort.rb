# Write a method that takes an Array as an argument, and sorts that Array using the
# bubble sort algorithm as just described. Note that your sort will be "in-place";
# that is, you will mutate the Array passed as an argument. You may assume that the
# Array contains at least 2 elements.

=begin
Problem
Inputs:
- an array
Outputs:
- the input array, mutated so that it has been sorted using the bubble sort algorithm
Explicit Rules:
- you can assume that the input array contains at least 2 elements
Implicit Rules:
- assume that array elements are all of a comparable type using <=>
Questions?:
----------------------------------------------------------
Scratch Pad
----------------------------------------------------------
Algorithm
- initialize a loop for each pass through the array:
  - initialize a local variable `any_swapped` to false
  - iterate through each element in the input array until the second to last element, with index
    - compare each element to the next element in the array
      - if the current element is greater than the next one:
        - swap the position of the two elements
        - assign `any_swapped` to true
  - if `any_swapped` is equal to false, break out of the loop
- return the (now mutated) input array
----------------------------------------------------------
=end

# require 'pry'

# def bubble_sort!(arr)
#   loop do
#     any_swapped = false

#     arr[0..-2].each_with_index do |el, index|
#       if el > arr[index + 1]
#         # binding.pry
#         arr[index], arr[index + 1] = arr[index + 1], arr[index]
#         any_swapped = true
#       end
#     end

#     break if !any_swapped
#   end

#   arr
# end
#------FURTHER EXPLORATION - with optimization--------------

def bubble_sort!(arr)
  arr_length = arr.size

  loop do
    last_el_to_check = 0

    1.upto(arr_length - 1) do |index|
      if arr[index - 1] > arr[index]
        arr[index - 1], arr[index] = arr[index], arr[index - 1]
        last_el_to_check = index
      end
    end

    break if last_el_to_check <= 1
  end

  arr
end


array = [5, 3]
bubble_sort!(array)
p array
p array == [3, 5]

array = [6, 2, 7, 1, 4]
bubble_sort!(array)
p array
p array == [1, 2, 4, 6, 7]

array = %w(Sue Pete Alice Tyler Rachel Kim Bonnie)
bubble_sort!(array)
p array
p array == %w(Alice Bonnie Kim Pete Rachel Sue Tyler)