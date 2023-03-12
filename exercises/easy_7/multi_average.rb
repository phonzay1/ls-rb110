# Write a method that takes an Array of integers as input, multiplies all the numbers
# together, divides the result by the number of entries in the Array, and then prints
# the result rounded to 3 decimal places. Assume the array is non-empty.

=begin
Problem
Inputs:
- an array of integers
Outputs:
- print the result of: multiplying all of the integers in the array together and dividing the result
by the number of elements in the array, rounded to 3 decimal places
Explicit Rules:
- assume the array isn't empty
Implicit Rules:
Questions?:
- assume that all entries in the input array are valid?
----------------------------------------------------------
Examples
show_multiplicative_average([3, 5])                # => The result is 7.500
show_multiplicative_average([6])                   # => The result is 6.000
show_multiplicative_average([2, 5, 7, 11, 13, 17]) # => The result is 28361.667
----------------------------------------------------------
Data Structure
----------------------------------------------------------
Scratch Pad
----------------------------------------------------------
Algorithm
- multiply all of the elements in the array together (use Enumerable#inject)
- divide the result by the number of elements in the array, converted to a float
point number
- print the result, formatted to round to 3 decimal places
----------------------------------------------------------
=end

def show_multiplicative_average(arr)
  puts format('%.3f', arr.inject(1, :*) / arr.size.to_f)
end

show_multiplicative_average([3, 5])                # => The result is 7.500
show_multiplicative_average([6])                   # => The result is 6.000
show_multiplicative_average([2, 5, 7, 11, 13, 17]) # => The result is 28361.667