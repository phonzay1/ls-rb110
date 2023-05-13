# Write a method that takes a string as an argument, and returns true if all parentheses
# in the string are properly balanced, false otherwise. To be properly balanced, parentheses
# must occur in matching '(' and ')' pairs.
# Note that balanced pairs must each start with a (, not a ).

=begin
Problem
Inputs:
- a string
Outputs:
- a boolean indicating whether all parentheses in the string are "properly balanced"
Explicit Rules:
- "balanced" parentheses must start with a ( and end with a )
Implicit Rules:
- a string with no parentheses is "balanced"
Questions?:
----------------------------------------------------------
Examples
balanced?('What (is) this?') == true
balanced?('What is) this?') == false
balanced?('What (is this?') == false
balanced?('((What) (is this))?') == true
balanced?('((What)) (is this))?') == false
balanced?('Hey!') == true
balanced?(')Hey!(') == false
balanced?('What ((is))) up(') == false
----------------------------------------------------------
Data Structure
----------------------------------------------------------
Scratch Pad
- iterate through the characters of the input string
- if a ( character is found, delete it and then find and delete the next ) character,
if found
- repeat until no more ( characters are found
- if the final string contains no parentheses, return true
----------------------------------------------------------
Algorithm
- initialize a variable `balance` to 0
- iterate through each character in the input string
  - if the character is a '(' increment `balance` by 1
  - if the character is a ')' decrement `balance` by 1
  - break if `balance` is ever < 0
- return true if `balance` is equal to 0, false otherwise
----------------------------------------------------------
=end

# def balanced?(str)
#   balance = 0

#   str.each_char do |char|
#     balance += 1 if char == '('
#     balance -= 1 if char == ')'
#     break if balance < 0
#   end

#   balance == 0
# end


# p balanced?('What (is) this?') == true
# p balanced?('What is) this?') == false
# p balanced?('What (is this?') == false
# p balanced?('((What) (is this))?') == true
# p balanced?('((What)) (is this))?') == false
# p balanced?('Hey!') == true
# p balanced?(')Hey!(') == false
# p balanced?('What ((is))) up(') == false

#----FURTHER EXPLORATION------------------------
# There are a few other characters that should be matching as well. Square brackets
# and curly brackets normally come in pairs. Quotation marks(single and double) also
# typically come in pairs and should be balanced. Can you expand this method to take
# into account those characters?

require 'pry'

# This solution isn't actually suited for real world applications: it doesn't check
# each character type individually, so a stray '(' could be accounted for by an
# extra closing character of one of the other punctuation types. It would be better
# to separate out each character type. Single quotation marks are also omitted here,
# to avoid the issue of possessive apostrophes.

def balanced?(str)
  balance = 0

  str.each_char do |char|
    balance += 1 if ['(', '[', '{'].include?(char)
    balance -= 1 if [')', ']', '}'].include?(char)
    break if balance < 0
  end

  binding.pry
  balance == 0
end

p balanced?('"The [sun] is {up}!" he said (happily).')
p balanced?('"The [sun is {up}!" he said (happily).')
p balanced?('"The [sun] is {up}!" he said (happily).')
p balanced?('"The [sun] is up}!" he said (happily).')
p balanced?('"The [sun] is {up}!" he said (happily.')