# Write a method that takes one argument, a string, and returns a new string with
# the words in reverse order.

=begin
Problem
Inputs:
- a string
Outputs:
- a *new* string with the words of the input string in reverse order
Explicit Rules:
Implicit Rules:
- an empty string should return an empty string
- a string with just spaces (any number) should return an empty string
Questions?:
----------------------------------------------------------
Examples
puts reverse_sentence('Hello World') == 'World Hello'
puts reverse_sentence('Reverse these words') == 'words these Reverse'
puts reverse_sentence('') == ''
puts reverse_sentence('    ') == '' # Any number of spaces results in ''
----------------------------------------------------------
Data Structure
----------------------------------------------------------
Scratch Pad
----------------------------------------------------------
Algorithm
- split the input string into individual words contained in an array, with words
defined as any sequence of non-space characters. Assign this array to a local variable
`words`
- Reverse the order of array elements in `words`
- join the elements of `words` together, separated by spaces, and return the resulting
string
----------------------------------------------------------
=end

# def reverse_sentence(str)
#   words = str.split
#   words.reverse!
#   words.join(' ')
# end

# puts reverse_sentence('Hello World') == 'World Hello'
# puts reverse_sentence('Reverse these words') == 'words these Reverse'
# puts reverse_sentence('') == ''
# puts reverse_sentence('    ') == '' # Any number of spaces results in ''
# ----------PART 2----------------------------------------
# Write a method that takes one argument, a string containing one or more words, and
# returns the given string with words that contain five or more characters reversed.
# Each string will consist of only letters and spaces. Spaces should be included only
# when more than one word is present.

=begin
Problem
Inputs:
- a string containing one or more words, consisting of only letters and spaces
Outputs:
- the input string with words that contain five or more characters reversed, and
words that contain four or fewer characters with their letters in the original order
Explicit Rules:
- Separate words with spaces; if only one word is present then no spaces are needed
Implicit Rules:
Questions?:
- does it matter if the returned string is a mutated version of the input string,
or a modified copy of the original string?
----------------------------------------------------------
Examples
puts reverse_words('Professional')          # => lanoisseforP
puts reverse_words('Walk around the block') # => Walk dnuora the kcolb
puts reverse_words('Launch School')         # => hcnuaL loohcS
----------------------------------------------------------
Data Structure
----------------------------------------------------------
Scratch Pad
----------------------------------------------------------
Algorithm
- split the input string into individual words, contained in an array. Assign this
array to a local variable `words`
- Iterate over and transform the words in `words`:
  - If the size of the word is 5 or more characters, reverse the order of characters
  in the word
  - Otherwise, return the word as-is
- join the words in `words` together, separated by spaces, and return the resulting
string
----------------------------------------------------------
=end

def reverse_words(str)
  words = str.split
  words.map! { |word| word.size >= 5 ? word.reverse : word }
  words.join(' ')
end

puts reverse_words('Professional')          # => lanoisseforP
puts reverse_words('Walk around the block') # => Walk dnuora the kcolb
puts reverse_words('Launch School')         # => hcnuaL loohcS