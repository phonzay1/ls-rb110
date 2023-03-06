# In the modern era under the Gregorian Calendar, leap years occur in every year that
# is evenly divisible by 4, unless the year is also divisible by 100. If the year is
# evenly divisible by 100, then it is not a leap year unless the year is evenly divisible by 400.

# Assume this rule is good for any year greater than year 0. Write a method that takes
# any year greater than 0 as input, and returns true if the year is a leap year, or
# false if it is not a leap year.

=begin
Problem
Inputs:
- a year (integer) greater than 0
Outputs:
- a boolean: true if the year is a leap year, false if it is not
Explicit Rules:
- leap years are evenly divisible by 4, unless the year is also divisible by 100
- if divisible by 100, the year is not a leap year unless it's also divisible by 400
Implicit Rules:
Questions?:
----------------------------------------------------------
Examples
leap_year?(2016) == true
leap_year?(2015) == false
leap_year?(2100) == false
leap_year?(2400) == true
leap_year?(240000) == true
leap_year?(240001) == false
leap_year?(2000) == true
leap_year?(1900) == false
leap_year?(1752) == true
leap_year?(1700) == false
leap_year?(1) == false
leap_year?(100) == false
leap_year?(400) == true
----------------------------------------------------------
Data Structure
----------------------------------------------------------
Scratch Pad
----------------------------------------------------------
Algorithm
- Check if the year is evenly divisible by 4, but not by 100. If so, return true
- Check if the year is evenly divisible by 400. If so, return true
- Return false if none of the above are true
----------------------------------------------------------
=end

# def leap_year?(year)
#   if year % 4 == 0 && year % 100 != 0
#     true
#   elsif year % 400 == 0
#     true
#   else
#     false
#   end
# end

# p leap_year?(2016) == true
# p leap_year?(2015) == false
# p leap_year?(2100) == false
# p leap_year?(2400) == true
# p leap_year?(240000) == true
# p leap_year?(240001) == false
# p leap_year?(2000) == true
# p leap_year?(1900) == false
# p leap_year?(1752) == true
# p leap_year?(1700) == false
# p leap_year?(1) == false
# p leap_year?(100) == false
# p leap_year?(400) == true

# -------------------------------------
# FURTHER EXPLORATION

# The order in which you perform tests for a leap year calculation is important.
# For what years will leap_year? fail if you rewrite it as:

# def leap_year?(year)
#   if year % 100 == 0
#     false
#   elsif year % 400 == 0
#     true
#   else
#     year % 4 == 0
#   end
# end

# This code will fail for years that are divisible by both 100 and 400 (ex. 2000,
# 2400)
#------------------------------------------------
# PART 2
# The British Empire adopted the Gregorian Calendar in 1752, which was a leap year.
# Prior to 1752, the Julian Calendar was used. Under the Julian Calendar, leap years
# occur in any year that is evenly divisible by 4.

# Using this information, update the method from the previous exercise to determine
# leap years both before and after 1752.

=begin
Problem
Inputs:
- a year (integer) greater than 0
Outputs:
- a boolean: true if the year is a leap year, false if it is not
Explicit Rules:
- Before 1752, leap years are all years that are evenly divisible by 4
- After 1752: leap years are evenly divisible by 4, unless the year is also divisible by 100
  - if divisible by 100, the year is not a leap year unless it's also divisible by 400
Implicit Rules:
- if the year is divisible by 400, then it's a leap year regardless of the time period
- otherwise if the year is divisible by 100 but not by 400, AND it occurs before 1752,
it's a leap year
- if the conditions above aren't applicable, then if the year is divisible by 4 it's
a leap year regardless of the time period
Questions?:
----------------------------------------------------------
Examples
leap_year?(2016) == true
leap_year?(2015) == false
leap_year?(2100) == false
leap_year?(2400) == true
leap_year?(240000) == true
leap_year?(240001) == false
leap_year?(2000) == true
leap_year?(1900) == false
leap_year?(1752) == true
leap_year?(1700) == true
leap_year?(1) == false
leap_year?(100) == true
leap_year?(400) == true
----------------------------------------------------------
Data Structure
----------------------------------------------------------
Scratch Pad
----------------------------------------------------------
Algorithm
- Check the following conditions:
  - if the year is divisible by 400, return true
  - otherwise if the year is divisible by 100 but not by 400, AND it occurs before 1752,
  return true
  - if the conditions above aren't applicable, then if the year is divisible by 4 return true
- Return false under any other conditions
----------------------------------------------------------
=end

def leap_year?(year)
  if year % 400 == 0
    true
  elsif year % 100 == 0
    year < 1752
  elsif year % 4 == 0
    true
  else
    false
  end
end


p leap_year?(2016) == true
p leap_year?(2015) == false
p leap_year?(2100) == false
p leap_year?(2400) == true
p leap_year?(240000) == true
p leap_year?(240001) == false
p leap_year?(2000) == true
p leap_year?(1900) == false
p leap_year?(1752) == true
p leap_year?(1700) == true
p leap_year?(1) == false
p leap_year?(100) == true
p leap_year?(400) == true