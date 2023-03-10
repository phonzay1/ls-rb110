# Write a method that takes an array of strings, and returns an array of the same
# string values, except with the vowels (a, e, i, o, u) removed.

=begin
Problem
Inputs:
- an array of strings
Outputs:
- an array of the same string values, but with their vowels removed
Explicit Rules:
- vowels include the letters a, e, i , o, u
Implicit Rules:
- if a string only includes vowels, it should be transformed to an empty string
- the returned array should have the same number of elements as the original array
- inputs can be upper and lower case
Questions?:
- should the method return the original (mutated) array, or a new array?
----------------------------------------------------------
Examples
remove_vowels(%w(abcdefghijklmnopqrstuvwxyz)) == %w(bcdfghjklmnpqrstvwxyz)
remove_vowels(%w(green YELLOW black white)) == %w(grn YLLW blck wht)
remove_vowels(%w(ABC AEIOU XYZ)) == ['BC', '', 'XYZ']
----------------------------------------------------------
Data Structure
----------------------------------------------------------
Scratch Pad
----------------------------------------------------------
Algorithm
- iterate over each element in the input array, deleting vowel characters, and
adding each of these new vowel-less strings to a copy of the original array
- return the new copy of the original array
----------------------------------------------------------
=end

def remove_vowels(strings_array)
  strings_array.map {|str| str.gsub(/[aeiouAEIOU]/, '')}
end

p remove_vowels(%w(abcdefghijklmnopqrstuvwxyz)) == %w(bcdfghjklmnpqrstvwxyz)
p remove_vowels(%w(green YELLOW black white)) == %w(grn YLLW blck wht)
p remove_vowels(%w(ABC AEIOU XYZ)) == ['BC', '', 'XYZ']