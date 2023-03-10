# Given a string that consists of some words (all lowercased) and an assortment of
# non-alphabetic characters, write a method that returns that string with all of
# the non-alphabetic characters replaced by spaces. If one or more non-alphabetic
# characters occur in a row, you should only have one space in the result (the result
# should never have consecutive spaces).

=begin
Problem
Inputs:
- a string with non-alphabetic characters, and alphabetic characters (all lower-case)
Outputs:
- the input string with non-alphabetic characters replaced by spaces
Explicit Rules:
- there should be no consecutive spaces in the output string (if the input string
contains multiple non-alphabetic characters in a row, replace all of those with one space)
Implicit Rules:
Questions?:
----------------------------------------------------------
Examples
cleanup("---what's my +*& line?") == ' what s my line '
----------------------------------------------------------
Data Structure
----------------------------------------------------------
Scratch Pad
----------------------------------------------------------
Algorithm
- Split the string into individual characters, contained in an array
- Check each character in the input string to see if it falls within the range 'a'..'z'
(i.e., it's a lowercase alphabetic character)
  - if it does, move onto the next character
  - if it doesn't:
    - check if the character preceding it is a space or an empty string
      - if it is, replace the current character with an empty string
      - if it isn't, replace the current character with a space
- join the characters within the array and return the new, modified string
----------------------------------------------------------
=end

def cleanup(str)
  characters = str.chars

  characters.each_with_index do |char, idx|
    next if ('a'..'z').include?(char)
    if characters[idx-1] == ' ' || characters[idx-1] == ''
      characters[idx] = ''
    else
      characters[idx] = ' '
    end
  end

  characters.join
end

p cleanup("---what's my +*& line?") == ' what s my line '