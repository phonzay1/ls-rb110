# Write a method that determines and returns the ASCII string value of a string that
# is passed in as an argument. The ASCII string value is the sum of the ASCII values
# of every character in the string. (You may use String#ord to determine the ASCII value of a character.)

=begin
Problem
Inputs:
- a string
Outputs:
- the ASCII string value of the string (an integer): the sum of the ASCII values
of every character in the string
Explicit Rules:
Implicit Rules:
- an empty string should return 0
Questions?:
----------------------------------------------------------
Examples
ascii_value('Four score') == 984
ascii_value('Launch School') == 1251
ascii_value('a') == 97
ascii_value('') == 0
----------------------------------------------------------
Data Structure
----------------------------------------------------------
Scratch Pad
----------------------------------------------------------
Algorithm
- initialize a variable `ascii_sum`, with a value of 0, to keep track of the running ASCII value total
- iterate through the characters in the string, adding the ASCII value of each
character to ascii_sum
- return the value of ascii_sum
----------------------------------------------------------
=end

def ascii_value(str)
  ascii_sum = 0
  str.each_char {|char| ascii_sum += char.ord}
  ascii_sum
end

p ascii_value('Four score') == 984
p ascii_value('Launch School') == 1251
p ascii_value('a') == 97
p ascii_value('') == 0
#---------------------------------------------------------
# FURTHER EXPLORATION
# There is an Integer method such that:
# char.ord.mystery == char
# where mystery is our mystery method. Can you determine what method name should be
# used in place of mystery? What happens if you try this with a longer string instead
# of a single character?

# The "mystery" method is `Integer#chr`. When you try this with a longer string
# vs a single character, the first character in the string is returned. Upon further
# investigation, when you call `String#ord` on a longer string, it returns the ASCII
# value for just the first character in the string.