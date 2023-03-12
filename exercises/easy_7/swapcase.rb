# Write a method that takes a string as an argument and returns a new string in which
# every uppercase letter is replaced by its lowercase version, and every lowercase letter
# by its uppercase version. All other characters should be unchanged.

# You may not use String#swapcase; write your own version of this method.

=begin
Problem
Inputs:
- a string
Outputs:
- a *new* string with uppercase letters replaced by their lowercase versions, and
vice versa
Explicit Rules:
- non-alphabetic characters should remain unchanged in the output string
Implicit Rules:
Questions?:
----------------------------------------------------------
Examples
swapcase('CamelCase') == 'cAMELcASE'
swapcase('Tonight on XYZ-TV') == 'tONIGHT ON xyz-tv'
----------------------------------------------------------
Data Structure
----------------------------------------------------------
Scratch Pad
----------------------------------------------------------
Algorithm
- initialize a constant UPPERCASE_LETTERS and assign it to an array of uppercase
letters from A-Z
- initialize a constant LOWERCASE_LETTERS and assign it to an array of lowercase
letters from a-z

Within the method definition:
-initialize a variable `swapcase_str` and assign it to an empty string
- iterate through the characters in the input string:
  - if the character is included in LOWERCASE_LETTERS, find its index within that
  array. Append the character at that index in UPPERCASE_LETTERS to `swapcase_str`
  - if the character is included in UPPERCASE_LETTERS, find its index within that
  array. Append the character at that index in LOWERCASE_LETTERS to `swapcase_str`
  - otherwise, append the original character to `swapcase_str`
- return `swapcase_str`
----------------------------------------------------------
=end

UPPERCASE_LETTERS = ('A'..'Z').to_a
LOWERCASE_LETTERS = ('a'..'z').to_a

def swapcase(str)
  swapcase_str = ''
  str.each_char do |char|
    if LOWERCASE_LETTERS.include?(char)
      swapcase_str << UPPERCASE_LETTERS[LOWERCASE_LETTERS.index(char)]
    elsif UPPERCASE_LETTERS.include?(char)
      swapcase_str << LOWERCASE_LETTERS[UPPERCASE_LETTERS.index(char)]
    else
      swapcase_str << char
    end
  end
  swapcase_str
end

p swapcase('CamelCase') == 'cAMELcASE'
p swapcase('Tonight on XYZ-TV') == 'tONIGHT ON xyz-tv'

