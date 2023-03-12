# Write a method that takes two Array arguments in which each Array contains a list
# of numbers, and returns a new Array that contains the product of each pair of numbers
# from the arguments that have the same index. You may assume that the arguments contain
# the same number of elements.

=begin
Problem
Inputs:
- two arrays of the same size, each containing a list of numbers
Outputs:
- a new array with the products of each pair of numbers from the input arrays that
have the same index
Explicit Rules:
Implicit Rules:
Questions?:
----------------------------------------------------------
Examples
multiply_list([3, 5, 7], [9, 10, 11]) == [27, 50, 77]
----------------------------------------------------------
Data Structure
----------------------------------------------------------
Scratch Pad
----------------------------------------------------------
Algorithm
- initialize a variable `products` and assign it to an empty array
- iterate over each element in the first input array, while referencing its index:
  - multiply each element by the element in the second input array that has the same index
- return `products`
----------------------------------------------------------
=end

# def multiply_list(arr1, arr2)
#   products = []
#   arr1.each_with_index { |num, index| products << (num * arr2[index]) }
#   products
# end
#-----------FURTHER EXPLORATION----------------------------
# The Array#zip method can be used to produce an extremely compact solution to this
# method. Read the documentation for zip, and see if you can come up with a one line
# solution (not counting the def and end lines).

def multiply_list(arr1, arr2)
  arr1.zip(arr2).map {|subarr| subarr[0] * subarr[1]}
end


p multiply_list([3, 5, 7], [9, 10, 11]) == [27, 50, 77]