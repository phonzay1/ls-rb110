# Write a method that takes a positive integer or zero, and converts it to a string representation.

# You may not use any of the standard conversion methods available in Ruby, such as
# Integer#to_s, String(), Kernel#format, etc. Your method should do this the old-fashioned
# way and construct the string by analyzing and manipulating the number.

=begin
Problem
Inputs:
- a positive integer or 0
Outputs:
- a string representation of the input integer
Explicit Rules:
- don't use built-in Ruby conversion methods
Implicit Rules:
- assume valid input (0 or a positive integer)
Questions?:
----------------------------------------------------------
Examples
integer_to_string(4321) == '4321'
integer_to_string(0) == '0'
integer_to_string(5000) == '5000'
----------------------------------------------------------
Data Structure
- convert digits of the integer to an array, to manipulate them
----------------------------------------------------------
Scratch Pad
- Integer#digits (will need to be reversed)
----------------------------------------------------------
Algorithm
- split the integer into its individual digits, contained in an array
- convert each digit to its string representation
- join the characters in the array to form one string
- return the string
----------------------------------------------------------
=end

# CONVERT_DIGITS = {0=>'0', 1=>'1', 2=>'2', 3=>'3', 4=>'4', 5=>'5', 6=>'6',
#                   7=>'7', 8=>'8', 9=>'9'}

# def integer_to_string(number)
#   digits = number.digits.reverse
#   digits.map! {|digit| CONVERT_DIGITS[digit]}
#   digits.join
# end

# p integer_to_string(4321) == '4321'
# p integer_to_string(0) == '0'
# p integer_to_string(5000) == '5000'
#----------------------------------------------------------
# Convert a signed number to a string
# In the previous exercise, you developed a method that converts non-negative numbers
# to strings. In this exercise, you're going to extend that method by adding the ability
# to represent negative numbers as well.

# Write a method that takes an integer, and converts it to a string representation.

# You may not use any of the standard conversion methods available in Ruby, such as
# Integer#to_s, String(), Kernel#format, etc. You may, however, use integer_to_string
# from the previous exercise.

=begin
Problem
Inputs:
- a positive or negative integer, or 0
Outputs:
- a string representation of the integer, including its sign
Explicit Rules:
Implicit Rules:
- positive integers should return a string with '+' as the first character
- 0 should return '0', without a '+' or '-'
Questions?:
----------------------------------------------------------
Examples
signed_integer_to_string(4321) == '+4321'
signed_integer_to_string(-123) == '-123'
signed_integer_to_string(0) == '0'
----------------------------------------------------------
Data Structure
----------------------------------------------------------
Scratch Pad
----------------------------------------------------------
Algorithm
- if the input integer is > 0, use the integer_to_string method and prepend a '+'
to the result
- if the input integer is < 0, multiply the input integer by -1. Then use the
integer_to_string method and prepend a '-' to the result
- if the input integer is == 0, use the integer_to_string method
----------------------------------------------------------
=end

# def signed_integer_to_string(integer)
#   if integer > 0
#     integer_to_string(integer).prepend('+')
#   elsif integer < 0
#     integer_to_string(-1 * integer).prepend('-')
#   else
#     integer_to_string(integer)
#   end
# end

# p signed_integer_to_string(4321) == '+4321'
# p signed_integer_to_string(-123) == '-123'
# p signed_integer_to_string(0) == '0'
#--------------------------------------------------
# Using the LS integer_to_string method solution:

DIGITS = ['0', '1', '2', '3', '4', '5', '6', '7', '8', '9']

def integer_to_string(number)
  result = ''
  loop do
    number, remainder = number.divmod(10)
    result.prepend(DIGITS[remainder])
    break if number == 0
  end
  result
end

def signed_integer_to_string(integer)
  if integer > 0
    integer_to_string(integer).prepend('+')
  elsif integer < 0
    integer_to_string(-1 * integer).prepend('-')
  else
    integer_to_string(integer)
  end
end

p signed_integer_to_string(4321) == '+4321'
p signed_integer_to_string(-123) == '-123'
p signed_integer_to_string(0) == '0'