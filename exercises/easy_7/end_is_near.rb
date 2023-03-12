# Write a method that returns the next to last word in the String passed to it as an argument.

# Words are any sequence of non-blank characters.

# You may assume that the input String will always contain at least two words.

=begin
Problem
Inputs:
- a string with at least two words
Outputs:
- the next to last word in the input string, where words are defined as any sequence
of non-blank characters
Explicit Rules:
Implicit Rules:
Questions?:
----------------------------------------------------------
Examples
penultimate('last word') == 'last'
penultimate('Launch School is great!') == 'is'
----------------------------------------------------------
Data Structure
----------------------------------------------------------
Scratch Pad
----------------------------------------------------------
Algorithm
- split the input string into an array of its individual words
- return the array element at the next to last index (-2)
----------------------------------------------------------
=end

# def penultimate(str)
#   str.split[-2]
# end

# p penultimate('last word') == 'last'
# p penultimate('Launch School is great!') == 'is'
#---------FURTHER EXPLORATION-----------------------------
# Our solution ignored a couple of edge cases because we explicitly stated that you didn't
# have to handle them: strings that contain just one word, and strings that contain no words.

# Suppose we need a method that retrieves the middle word of a phrase/sentence. What
# edge cases need to be considered? How would you handle those edge cases without
# ignoring them? Write a method that returns the middle word of a phrase or sentence.
# It should handle all of the edge cases you thought of.

# Edge cases/how to handle them:
# - empty input string: return an empty string
# - input string with just one word: return the one word
# - input string with an even number of words - which word is considered the "middle"?:
# return the word on the side of the string closer to the end

def middle_word(str)
  words = str.split
  return str if words.empty?
  words[words.size/2]
end

p middle_word('')
p middle_word('hi')
p middle_word('it was the best of times')
p middle_word('or was it the worst of times?')