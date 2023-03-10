# Write a method that takes a string with one or more space separated words and
# returns a hash that shows the number of words of different sizes.

# Words consist of any string of characters that do not include a space.

=begin
Problem
Inputs:
- string with space separated words
Outputs:
- hash that shows the number of words of different character counts in the input string
Explicit Rules:
- words are any string of characters (alphabetic or not) that don't include a space
Implicit Rules:
- non-alphabetic characters are included in the character counts
- within the output hash, the keys should be number of characters and values should
be number of times words of that size appear in the input string
- an empty string should return an empty hash
- keys and values in the output hash should both be integers
Questions?:
----------------------------------------------------------
Examples
word_sizes('Four score and seven.') == { 3 => 1, 4 => 1, 5 => 1, 6 => 1 }
word_sizes('Hey diddle diddle, the cat and the fiddle!') == { 3 => 5, 6 => 1, 7 => 2 }
word_sizes("What's up doc?") == { 6 => 1, 2 => 1, 4 => 1 }
word_sizes('') == {}
----------------------------------------------------------
Data Structure
----------------------------------------------------------
Scratch Pad
----------------------------------------------------------
Algorithm
- split the string into individual words, contained within an array assigned to
the variable `words`
- initialize an empty hash to the variable `word_counts`
- iterate through each word in `words`
  - for each word, check if a key with the number of the length of the word already
  exists in `word_counts`. If so, increment the value of that key by 1
    - if not, add a key with the number of the length of the word, and assign its
    value to 1
- return `word_counts`
----------------------------------------------------------
=end

# def word_sizes(sentence)
#   words = sentence.split
#   word_counts = {}

#   words.each do |word|
#     unless word_counts.has_key?(word.size)
#       word_counts[word.size] = 1
#     else
#       word_counts[word.size] += 1
#     end
#   end

#   word_counts
# end

# p word_sizes('Four score and seven.') == { 3 => 1, 4 => 1, 5 => 1, 6 => 1 }
# p word_sizes('Hey diddle diddle, the cat and the fiddle!') == { 3 => 5, 6 => 1, 7 => 2 }
# p word_sizes("What's up doc?") == { 6 => 1, 2 => 1, 4 => 1 }
# p word_sizes('') == {}
#-----------PART 2-----------------------------------
# Modify the word_sizes method from the previous exercise to exclude non-letters
# when determining word size. For instance, the length of "it's" is 3, not 4.

=begin
Problem
Inputs:
- a string with space-separated words
Outputs:
- a hash with keys indicating the letter count of words in the input string, and
values indicating how many times words of that letter count occur in the input string
Explicit Rules:
- only count alphabetic characters when determining word size
Implicit Rules:
- an empty string should return an empty hash
Questions?:
----------------------------------------------------------
Examples
word_sizes('Four score and seven.') == { 3 => 1, 4 => 1, 5 => 2 }
word_sizes('Hey diddle diddle, the cat and the fiddle!') == { 3 => 5, 6 => 3 }
word_sizes("What's up doc?") == { 5 => 1, 2 => 1, 3 => 1 }
word_sizes('') == {}
----------------------------------------------------------
Data Structure
----------------------------------------------------------
Scratch Pad
----------------------------------------------------------
Algorithm
- remove non-alphabetic and non-space characters from the string
- split the string into individual words, contained within an array assigned to
the variable `words`
- initialize an empty hash to the variable `word_counts`
- iterate through each word in `words`
  - for each word, check if a key with the number of the length of the word already
  exists in `word_counts`. If so, increment the value of that key by 1
    - if not, add a key with the number of the length of the word, and assign its
    value to 1
- return `word_counts`
----------------------------------------------------------
=end

def word_sizes(sentence)
  letters_only = sentence.gsub(/[^A-Za-z ]/, '')
  words = letters_only.split
  word_counts = {}

  words.each do |word|
    unless word_counts.has_key?(word.size)
      word_counts[word.size] = 1
    else
      word_counts[word.size] += 1
    end
  end

  word_counts
end

p word_sizes('Four score and seven.') == { 3 => 1, 4 => 1, 5 => 2 }
p word_sizes('Hey diddle diddle, the cat and the fiddle!') == { 3 => 5, 6 => 3 }
p word_sizes("What's up doc?") == { 5 => 1, 2 => 1, 3 => 1 }
p word_sizes('') == {}