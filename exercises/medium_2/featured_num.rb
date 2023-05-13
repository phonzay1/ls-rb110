# A featured number (something unique to this exercise) is an odd number that is a
# multiple of 7, and whose digits occur exactly once each. So, for example, 49 is
# a featured number, but 98 is not (it is not odd), 97 is not (it is not a multiple of 7),
# and 133 is not (the digit 3 appears twice).

# Write a method that takes a single integer as an argument, and returns the next
# featured number that is greater than the argument. Return an error message if there
# is no next featured number.

=begin
Problem
Inputs:
- an integer
Outputs:
- the next "featured number" that is greater than the input integer, or an error
message if a "next featured number" doesn't exist
Explicit Rules:
- a featured number is an odd number that's a multiple of 7, with no repeat
digits
Implicit Rules:
Questions?:
----------------------------------------------------------
Examples
----------------------------------------------------------
Data Structure
----------------------------------------------------------
Scratch Pad
- Integer#digits
----------------------------------------------------------
Algorithm
- create a helper method, `featured_num?` that checks whether a number meets the
following 3 conditions:
   - is odd AND
   - is a multiple of 7 (number / 7 has a remainder of 0) AND
   - has all unique digits

- iterate over the numbers following the input integer, checking if each
number returns true when passed as an argument to `featured_num?`. If a number
does, return that number and break out of the iteration
  - if the number being checked is > 9876543210 (the highest possible number with
  all unique digits), break out of the iteration and return an error message
----------------------------------------------------------
=end

def featured_num?(num)
  num.odd? &&
  num % 7 == 0 &&
  num.digits == num.digits.uniq
end

def featured(integer)
  (integer + 1..).each do |num|
    break num if featured_num?(num)
    break "There is no possible next featured number!" if num > 9876543210
  end
end

p featured(9_999_999_999) # -> There is no possible number that fulfills those requirements
p featured(12) == 21
p featured(20) == 21
p featured(21) == 35
p featured(997) == 1029
p featured(1029) == 1043
p featured(999_999) == 1_023_547
p featured(999_999_987) == 1_023_456_987

