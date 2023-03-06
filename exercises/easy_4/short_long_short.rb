=begin
Write a method that takes two strings as arguments, determines the longest of
the two strings, and then returns the result of concatenating the shorter string,
the longer string, and the shorter string once again. You may assume that the
strings are of different lengths.

Problem
Inputs:
- two strings of different lengths
Outputs:
- concatenated together: the shorter string, longer string, then shorter string again
Clarifying Qs:

Examples/Test Cases:
short_long_short('abc', 'defgh') == "abcdefghabc"
short_long_short('abcde', 'fgh') == "fghabcdefgh"
short_long_short('', 'xyz') == "xyz"

D/A:
- Determine the length of each of the two strings (String#size)
- If string1 is longer, concatenate string2 + string1 + string2
- If string2 is longer, concatenate string1 + string2 + string1
=end

def short_long_short(str1, str2)
  str1_length = str1.length
  str2_length = str2.length

  if str1_length > str2_length
    str2 + str1 + str2
  else
    str1 + str2 + str1
  end
end

puts short_long_short('abc', 'defgh') == "abcdefghabc"
puts short_long_short('abcde', 'fgh') == "fghabcdefgh"
puts short_long_short('', 'xyz') == "xyz"
