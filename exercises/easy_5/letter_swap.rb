# Given a string of words separated by spaces, write a method that takes this string
# of words and returns a string in which the first and last letters of every word are swapped.

# You may assume that every word contains at least one letter, and that the string
# will always contain at least one word. You may also assume that each string contains
# nothing but words and spaces.

=begin
Problem
Inputs:
- a string of words separated by spaces
Outputs:
- the input string with the first and least letters of every word swapped
Explicit Rules:
- you can take for granted that every word contains at least one letter, the string
will contain at least one word, and each string contains only words and spaces
Implicit Rules:
- for one-letter words, nothing is changed
Questions?:
- does it matter if the output string is the original string object modified, or
a copy of the original string?
----------------------------------------------------------
Examples
swap('Oh what a wonderful day it is') == 'hO thaw a londerfuw yad ti si'
swap('Abcde') == 'ebcdA'
swap('a') == 'a'
----------------------------------------------------------
Data Structure
- string
- convert string to array to work with each individual word
----------------------------------------------------------
Scratch Pad
- swap str[0] with str[-1]
  - indexed assignment is mutating, so use separate variables to store their initial
  values
- do this for each word
- rejoin the array of words
----------------------------------------------------------
Algorithm
- split the input string into words, contained in an array
- for each word, assign the variable `first_char` to letter at index 0, and the
variable `last_char` to the letter at index -1
  - assign the letter at index 0 in the word to the value referenced by `last_char`
  - assign the letter at index -1 in the word to the value referenced by `first_char`
- join the (now mutated) words in the array together into a string, with spaces
in between them
- return this new version of the string
----------------------------------------------------------
=end

# def swap(sentence)
#   words = sentence.split

#   words.each do |word|
#     first_char = word[0]
#     last_char = word[-1]
#     word[0] = last_char
#     word[-1] = first_char
#   end

#   words.join(' ')
# end

# p swap('hi there friend')
# p swap('Oh what a wonderful day it is') == 'hO thaw a londerfuw yad ti si'
# p swap('Abcde') == 'ebcdA'
# p swap('a') == 'a'
# --------FURTHER EXPLORATION-----------------------------------------
# How come our solution passes word into the swap_first_last_characters method invocation
# instead of just passing the characters that needed to be swapped? Suppose we had this implementation:

def swap_first_last_characters(a, b)
  a, b = b, a
end

# and called the method like this:
# swap_first_last_characters(word[0], word[-1])
# Would this method work? Why or why not?

# This method wouldn't work, as it doesn't return the actual word with its letters
# swapped. The last evaluated expression in the method is the assignment of variables
# `a` and `b`, so the result of this assignment is returned by the method (in this case,
# an array with the original last character and the original first character of the word).

# Even if this method were set up to return the word, it doesn't actually mutate the
# argument, so the word would remain the same with its letters unswapped. The original
# method implementation used indexed assignment, which is mutating, but in this method
# implementation the method parameters `a` and `b` are reassigned, which has no effect
# on the original `word` object.

def swap(words)
  result = words.split.map do |word|
    swap_first_last_characters(word[0], word[-1])
  end
  result.join(' ')
end

p swap('hi there friend')
p swap('Oh what a wonderful day it is')
p swap('Abcde')
p swap('a')

str = 'garlic'
swap_first_last_characters(str[0], str[-1])
p str
