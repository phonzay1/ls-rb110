# Write a method that returns the number of Friday the 13ths in the year given by
# an argument. You may assume that the year is greater than 1752 (when the United
# Kingdom adopted the modern Gregorian Calendar) and that it will remain in use for
# the foreseeable future.

=begin
Problem
Inputs:
- a positive integer representing a year after 1752
Outputs:
- an integer representing how many Friday the 13ths occur in that year
Explicit Rules:
Implicit Rules:
Questions?:
----------------------------------------------------------
Examples
----------------------------------------------------------
Data Structure
----------------------------------------------------------
Scratch Pad
----------------------------------------------------------
Algorithm
- initialize a variable `friday_13s` to 0
- iterate through each month in the input year, checking to see if the 13th day
that month was a Friday. If so, increment `friday_13s` by 1.
- return `friday_13s`
----------------------------------------------------------
=end

require 'date'

def friday_13th(year)
  friday_13s = 0
  1.upto(12) { |month| friday_13s += 1 if Date.new(year, month, 13).friday? }
  friday_13s
end

p friday_13th(2015) == 3
p friday_13th(1986) == 1
p friday_13th(2019) == 2