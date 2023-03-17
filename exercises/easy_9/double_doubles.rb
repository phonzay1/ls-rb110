# A double number is a number with an even number of digits whose left-side digits
# are exactly the same as its right-side digits. For example, 44, 3333, 103103, 7676
# are all double numbers. 444, 334433, and 107 are not.

# Write a method that returns 2 times the number provided as an argument, unless the
# argument is a double number; double numbers should be returned as-is.

=begin
Problem
Inputs:
- a number
Outputs:
- if the input number is a double number: return the input number. If the input number
is not a double number, return the input number * 2.
Explicit Rules:
Implicit Rules:
Questions?:
- can float point numbers be input? or only integers?
----------------------------------------------------------
Examples
twice(37) == 74
twice(44) == 44
twice(334433) == 668866
twice(444) == 888
twice(107) == 214
twice(103103) == 103103
twice(3333) == 3333
twice(7676) == 7676
twice(123_456_789_123_456_789) == 123_456_789_123_456_789
twice(5) == 10
----------------------------------------------------------
Data Structure
----------------------------------------------------------
Scratch Pad
----------------------------------------------------------
Algorithm
- determine if input number is a double number
  - split the number into its individual digits, contained in an array. Assign
  this array to a local variable `digits`
  - **Integer#digits will return the digits in reverse order. This is OK for
  our purposes here, but let's reverse `digits` anyway just in case
  - it's a double number if the following two arrays are equal to each other: `digits` from
  index 0 to index ((digits.size/2)-1) and `digits` from index (digits.size/2) to index -1
- if the input number is a double number, return it as-is
- if the input number isn't a double number, return the input number * 2
----------------------------------------------------------
=end

def twice(number)
  digits = number.digits.reverse
  if digits[0..((digits.size/2) - 1)] == digits[(digits.size/2)..-1] && digits.size > 1
    number
  else
    number * 2
  end
end


p twice(37) == 74
p twice(44) == 44
p twice(334433) == 668866
p twice(444) == 888
p twice(107) == 214
p twice(103103) == 103103
p twice(3333) == 3333
p twice(7676) == 7676
p twice(123_456_789_123_456_789) == 123_456_789_123_456_789
p twice(5) == 10