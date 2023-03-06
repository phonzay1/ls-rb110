# Create a hash that expresses the frequency with which each letter occurs in this string:

# statement = "The Flintstones Rock"

=begin
Problem
Inputs:
-string
Outputs:
- hash with keys of each letter occurring in the string, and values of how many
times that letter occurs in the string
Explicit Rules:
Implicit Rules:
- uppercase and lowercase versions of the same letter are counted separately
(i.e. count 't' separately from 'T')
- order of key/value pairs doesn't matter
Questions?:
----------------------------------------------------------
Examples
{ "F"=>1, "R"=>1, "T"=>1, "c"=>1, "e"=>2, ... }
----------------------------------------------------------
Data Structure
----------------------------------------------------------
Scratch Pad
- Array#count
- Array#uniq
----------------------------------------------------------
Algorithm
- Split the string into individual letters, contained in an array
- Initialize an empty array (letters_with_count) to hold the arrays of letter/count pairs
- Iterate over each character in the string:
  - For each character, return an array with two elements: the letter and the
  number of times it occurs in the string
  - Add each of these arrays to letters_with_count
- Remove duplicate elements from letters_with_count
- Convert letters_with_count to a hash
----------------------------------------------------------
=end

statement = "The Flintstones Rock"

letters = statement.chars.delete_if { |char| char == ' ' }
letters_with_count = []

letters.each do |letter|
  letters_with_count << [letter, letters.count(letter)]
end

letters_with_count_hash = letters_with_count.uniq.to_h

p letters_with_count_hash

