# Write a method that takes one argument, a positive integer, and returns a list
# of the digits in the number.

=begin
Problem
Inputs:
- a positive integer
Outputs:
- a list of the digits in the input integer
Explicit Rules:
Implicit Rules:
- the digits should be contained in an array, listed in the order in which they
appear in the input integer
Questions?:
----------------------------------------------------------
Examples
puts digit_list(12345) == [1, 2, 3, 4, 5]     # => true
puts digit_list(7) == [7]                     # => true
puts digit_list(375290) == [3, 7, 5, 2, 9, 0] # => true
puts digit_list(444) == [4, 4, 4]             # => true
----------------------------------------------------------
Data Structure
----------------------------------------------------------
Scratch Pad
----------------------------------------------------------
Algorithm
- split the integer into its digits, contained in an array, using the `Integer#digits`
method
- this will return an array of digits listed from least to most significant, therefore,
reverse the order of digits in the array
----------------------------------------------------------
=end

def digit_list(number)
  number.digits.reverse
end

puts digit_list(12345) == [1, 2, 3, 4, 5]     # => true
puts digit_list(7) == [7]                     # => true
puts digit_list(375290) == [3, 7, 5, 2, 9, 0] # => true
puts digit_list(444) == [4, 4, 4]             # => true
