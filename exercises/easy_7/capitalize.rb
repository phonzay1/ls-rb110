# Write a method that takes a single String argument and returns a new string that
# contains the original value of the argument with the first character of every word
# capitalized and all other letters lowercase.

# You may assume that words are any sequence of non-blank characters.

=begin
Problem
Inputs:
- a string
Outputs:
- a *new* string that contains all of the words from the input string, with the first
character of every word capitalized and all other letters lowercase
Explicit Rules:
Implicit Rules:
- if the first character of a word is non-alphabetic, then in the returned string
all of the alphabetic characters in that word should be lowercase
Questions?:
----------------------------------------------------------
Examples
word_cap('four score and seven') == 'Four Score And Seven'
word_cap('the javaScript language') == 'The Javascript Language'
word_cap('this is a "quoted" word') == 'This Is A "quoted" Word'
----------------------------------------------------------
Data Structure
----------------------------------------------------------
Scratch Pad
----------------------------------------------------------
Algorithm
- initialize a variable `words` and assign it to the result of splitting the input
string into its individual words, contained in an array
- iterate through `words` and capitalize each word (capitalize the first character
and downcase all others)
- join the elements from `words` back together into a string, with words separated
by spaces - return this string
----------------------------------------------------------
=end

# def word_cap(str)
#   words = str.split
#   words.map {|word| word.capitalize}.join(' ')
# end
#-------FURTHER EXPLORATION------------------------------
# Ruby conveniently provides the String#capitalize method to capitalize strings.
# Without that method, how would you solve this problem? Try to come up with at least two solutions.

# def word_cap(str)
#   words = str.split
#   words.each do |word|
#     index = 0
#     loop do
#       break if index == word.size
#       word[index] = index < 1 ? word[index].upcase : word[index].downcase
#       index += 1
#     end
#   end
#   words.join(' ')
# end

def word_cap(str)
  capitalized_str = ''
  index = 0

  loop do
    break if index == str.size
    if index == 0 || str[index-1] == ' '
      capitalized_str << str[index].upcase
    else
      capitalized_str << str[index].downcase
    end
    index +=1
  end

  capitalized_str
end


p word_cap('four score and seven') #== 'Four Score And Seven'
p word_cap('the javaScript language') #== 'The Javascript Language'
p word_cap('this is a "quoted" word')# == 'This Is A "quoted" Word'