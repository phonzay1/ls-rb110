# Write a method that takes a String of digits, and returns the appropriate number
# as an integer. You may not use any of the methods mentioned above.

# For now, do not worry about leading + or - signs, nor should you worry about invalid
# characters; assume all characters will be numeric.

# You may not use any of the standard conversion methods available in Ruby to convert
# a string to a number, such as String#to_i, Integer(), etc. Your method should do this
# the old-fashioned way and calculate the result by analyzing the characters in the string.

=begin
Problem
Inputs:
- a string of digits (without leading + or 1 signs)
Outputs:
- the string of digits converted to an integer
Explicit Rules:
- do not use built-in Ruby string to number conversion methods
- don't worry about invalid characters, assume valid input
Implicit Rules:
Questions?:
----------------------------------------------------------
Examples
string_to_integer('4321') == 4321
string_to_integer('570') == 570
----------------------------------------------------------
Data Structure
----------------------------------------------------------
Scratch Pad
- Array#map
----------------------------------------------------------
Algorithm
- split the string into individual characters, contained in an array
- iterate over each string array element, transform it to the integer
version of itself, and add each transformed element to a new array: digits
- initialize a variable integer with the value of 0
- reverse the order of elements in digits
- for each element in digits, add the value of that element * 10^index to the value
referenced by integer
- return integer
----------------------------------------------------------
=end

DIGIT_CONVERSION = {'0' => 0,
                    '1' => 1,
                    '2' => 2,
                    '3' => 3,
                    '4' => 4,
                    '5' => 5,
                    '6' => 6,
                    '7' => 7,
                    '8' => 8,
                    '9' => 9
}

def string_to_integer(str_of_digits)
  chars = str_of_digits.split('')

  digits = chars.map { |char| DIGIT_CONVERSION[char] }

  integer = 0
  digits.reverse.each_with_index do |digit, index|
    integer += digit * 10**index
  end

  integer
end

# p string_to_integer('4321') == 4321
# p string_to_integer('570') == 570
#---------------------------------------------------
# Convert string to signed number
# Write a method that takes a String of digits, and returns the appropriate number
# as an integer. The String may have a leading + or - sign; if the first character
# is a +, your method should return a positive number; if it is a -, your method
# should return a negative number. If no sign is given, you should return a positive number.

# You may assume the string will always contain a valid number.

# You may not use any of the standard conversion methods available in Ruby, such as
# String#to_i, Integer(), etc. You may, however, use the string_to_integer method
# from the previous lesson.

=begin
Problem
Inputs:
- a string of digits, potentially with a leading + or - sign
Outputs:
- the string of digits converted to a positive or negative integer, based on the input
Explicit Rules:
- do not use built-in Ruby string to number conversion methods
- don't worry about invalid characters, assume valid input
- if the first character is a +, or there's no leading + or -, return a positive number
- if the first character is a -, return a negative number
Implicit Rules:
Questions?:
----------------------------------------------------------
Examples
string_to_signed_integer('4321') == 4321
string_to_signed_integer('-570') == -570
string_to_signed_integer('+100') == 100
----------------------------------------------------------
Data Structure
----------------------------------------------------------
Scratch Pad
----------------------------------------------------------
Algorithm
- Check if the first character of the string is included in the range '0' - '9'
  - if so, return the result of passing the string to the string_to_integer method
- Check if the first character of the string is +, if so remove the first character then
return the result of passing the string to the string_to_integer method
- Check if the first character of the string is -, if so remove the first character then
return the result of passing the string to the string_to_integer method * -1
----------------------------------------------------------
=end

def string_to_signed_integer(str)
  if ('0'..'9').include?(str[0])
    string_to_integer(str)
  elsif str[0] == '+'
    str.slice!(0)
    string_to_integer(str)
  elsif str[0] == '-'
    str.slice!(0)
    string_to_integer(str) * -1
  end
end

p string_to_signed_integer('4321') == 4321
p string_to_signed_integer('-570') == -570
p string_to_signed_integer('+100') == 100
#---------------------------------------------------------
# FURTHER EXPLORATION
# In our solution, we call string[1..-1] twice, and call string_to_integer three times.
# This is somewhat repetitive. Refactor our solution so it only makes these two calls once each.

def string_to_signed_integer(string)
  case string[0]
  when '-' then -string_to_integer(string[1..-1])
  when '+' then string_to_integer(string[1..-1])
  else          string_to_integer(string)
  end
end