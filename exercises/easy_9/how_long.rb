# Write a method that takes a string as an argument, and returns an Array that
# contains every word from the string, to which you have appended a space and the word length.

# You may assume that words in the string are separated by exactly one space, and
# that any substring of non-space characters is a word.

=begin
Problem
Inputs:
- a string
Outputs:
- an array with every word from the input string, with a space and the word length
(as an integer) appended to it
Explicit Rules:
- a substring of non-space characters is a word
Implicit Rules:
- count non-alphabetic characters when counting the word lengths
- an empty input string should return an empty array
Questions?:
----------------------------------------------------------
Examples
word_lengths("cow sheep chicken") == ["cow 3", "sheep 5", "chicken 7"]

word_lengths("baseball hot dogs and apple pie") ==
  ["baseball 8", "hot 3", "dogs 4", "and 3", "apple 5", "pie 3"]

word_lengths("It ain't easy, is it?") == ["It 2", "ain't 5", "easy, 5", "is 2", "it? 3"]

word_lengths("Supercalifragilisticexpialidocious") ==
  ["Supercalifragilisticexpialidocious 34"]

word_lengths("") == []
----------------------------------------------------------
Data Structure
----------------------------------------------------------
Scratch Pad
----------------------------------------------------------
Algorithm
- separate the input string into its individual words, contained in an array. Assign
this array to a local variable `words`
- iterate over `words`, permanently transforming each element to:
  - the string element with a space and the character count of the string appended to it
- return `words`
----------------------------------------------------------
=end

def word_lengths(str)
  words = str.split
  words.map! { |word| word + ' ' + word.size.to_s }
  words
end


p word_lengths("cow sheep chicken") == ["cow 3", "sheep 5", "chicken 7"]

p word_lengths("baseball hot dogs and apple pie") ==
  ["baseball 8", "hot 3", "dogs 4", "and 3", "apple 5", "pie 3"]

p word_lengths("It ain't easy, is it?") == ["It 2", "ain't 5", "easy, 5", "is 2", "it? 3"]

p word_lengths("Supercalifragilisticexpialidocious") ==
  ["Supercalifragilisticexpialidocious 34"]

p word_lengths("") == []