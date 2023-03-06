# Write a method that takes a year as input and returns the century. The return value
# should be a string that begins with the century number, and ends with st, nd, rd, or th
# as appropriate for that number.

# New centuries begin in years that end with 01. So, the years 1901-2000 comprise the 20th century.

=begin
Problem
Inputs:
- a year (integer)
Outputs:
- a string representing what century that year occurs in (ex. 2000 => '20th')
Explicit Rules:
- years ending in 0 do not indicate a new century; years ending in 01 do
- century prefixes with a second to last digit of 1 should return a string ending in 'th', otherwise:
  - century prefixes ending in 1 should return a string ending in 'st'
  -                            2                                  'nd'
  -                           3                                  'rd'
  -                           4, 5, 6, 7, 8, 9, 0                'th'
Implicit Rules:
- We're only considering AD years, not BC
- years 0 - 100 are in the 1st century
Questions?:
----------------------------------------------------------
Examples
century(2000) == '20th'
century(2001) == '21st'
century(1965) == '20th'
century(256) == '3rd'
century(5) == '1st'
century(10103) == '102nd'
century(1052) == '11th'
century(1127) == '12th'
century(11201) == '113th'

Edge cases
- year 0
----------------------------------------------------------
Data Structure
- input is integer, and output is string
----------------------------------------------------------
Scratch Pad
- use case statement with index[-1] for suffixes
----------------------------------------------------------
Algorithm
- initialize a variable century_prefix and assign it to the year converted to a string
- assign century_prefix to the result of doing:
  - if length of century_prefix is <= 2, assign century_prefix to '1'
  - if length of century_prefix is > 2 and last digit of year is >= 1, remove last 2 digits of year and add 1
  - if length of century_prefix is > 2 and last digit of year is 0, just remove last 2 digits
- add a suffix to century_prefix, based on the rules in the problem statement
- return the complete century string with prefix and suffix
----------------------------------------------------------
=end

def century_prefix(year)
  century_prefix = year.to_s
  if century_prefix.length <= 2
    century_prefix = '1'
  elsif century_prefix.end_with?('1', '2', '3', '4', '5', '6', '7', '8', '9')
    century_prefix.slice!(-2, 2)
    century_prefix = (century_prefix.to_i + 1).to_s
  else
    century_prefix.slice!(-2, 2)
    century_prefix
  end
end

def century_suffix(prefix)
if prefix[-2] == '1'
  'th'
else
  case prefix[-1]
  when '1'
    'st'
  when '2'
    'nd'
  when '3'
    'rd'
  else
    'th'
  end
end
end

def century(year)
  century_name = century_prefix(year) + century_suffix(century_prefix(year))
  century_name
end

p century(2000) == '20th'
p century(2001) == '21st'
p century(1965) == '20th'
p century(256) == '3rd'
p century(5) == '1st'
p century(20) == '1st'
p century(10103) == '102nd'
p century(1052) == '11th'
p century(1127) == '12th'
p century(11201) == '113th'

