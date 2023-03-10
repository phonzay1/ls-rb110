# Write a method that takes a string argument and returns a new string that contains
# the value of the original string with all consecutive duplicate characters collapsed
# into a single character. You may not use String#squeeze or String#squeeze!.

=begin
Problem
Inputs:
- a string
Outputs:
- a *new* string that's a copy of the input string, but with all consecutive duplicate
characters consolidated to one copy of that character
Explicit Rules:
Implicit Rules:
- an empty string should return an empty string
Questions?:
----------------------------------------------------------
Examples
crunch('ddaaiillyy ddoouubbllee') == 'daily double'
crunch('4444abcabccba') == '4abcabcba'
crunch('ggggggggggggggg') == 'g'
crunch('a') == 'a'
crunch('') == ''
----------------------------------------------------------
Data Structure
----------------------------------------------------------
Scratch Pad
----------------------------------------------------------
Algorithm
- split the input string into its individual characters, contained in an array.
Assign this array to a new variable, `chars`
- initialize a variable `clean_string` and assign it to an empty string.
- iterate through the characters in `chars`, adding each one to the end of `clean_string`
*unless* it is equal to the character currently at the end of `clean_string`
- return `clean_string`
----------------------------------------------------------
=end

def crunch(str)
  chars = str.chars
  clean_string = ''

  chars.each do |char|
    clean_string << char unless char == clean_string[-1]
  end

  clean_string
end

p crunch('ddaaiillyy ddoouubbllee') == 'daily double'
p crunch('4444abcabccba') == '4abcabcba'
p crunch('ggggggggggggggg') == 'g'
p crunch('a') == 'a'
p crunch('') == ''