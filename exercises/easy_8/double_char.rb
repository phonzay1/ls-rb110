# Write a method that takes a string, and returns a new string in which every character is doubled.

=begin
Problem
Inputs:
- a string
Outputs:
- a *new* string in which every character from the input string is doubled
Explicit Rules:
Implicit Rules:
- double *every* character, including spaces and non-alphabetic characters
- an empty string should return an empty string
Questions?:
----------------------------------------------------------
Examples
repeater('Hello') == "HHeelllloo"
repeater("Good job!") == "GGoooodd  jjoobb!!"
repeater('') == ''
----------------------------------------------------------
Data Structure
----------------------------------------------------------
Scratch Pad
- String#chars, then call #map on the array and transform each element into a
doubled version
----------------------------------------------------------
Algorithm
- split the string into individual characters, contained in an array. Assign this
array to a local variable `doubles`
- transform each `doubles` array element into a doubled version of itself
- join the array elements in `doubles` together, and return the resulting string
----------------------------------------------------------
=end

# def repeater(str)
#   doubles = str.chars
#   doubles.map! do |char|
#     char * 2
#   end
#   doubles.join
# end

# p repeater('Hello') == "HHeelllloo"
# p repeater("Good job!") == "GGoooodd  jjoobb!!"
# p repeater('') == ''
#-----------PART 2----------------------------------
# Write a method that takes a string, and returns a new string in which every consonant
# character is doubled. Vowels (a,e,i,o,u), digits, punctuation, and whitespace should not be doubled.

=begin
Problem
Inputs:
- a string
Outputs:
- a new string in which every consonant character is doubled, and any other type
of character is not doubled
Explicit Rules:
Implicit Rules:
- an empty input string should return an empty string
Questions?:
----------------------------------------------------------
Examples
double_consonants('String') == "SSttrrinngg"
double_consonants("Hello-World!") == "HHellllo-WWorrlldd!"
double_consonants("July 4th") == "JJullyy 4tthh"
double_consonants('') == ""
----------------------------------------------------------
Data Structure
----------------------------------------------------------
Scratch Pad
----------------------------------------------------------
Algorithm
- initialize a constant `CONSONANTS` to an array containing all upper and lowercase
consonants
- split the input string into an array of individual characters. Assign this array
to a local variable `doubles`
- iterate through each element in `doubles`:
  - if the element is included in CONSONANTS, then transform the element to a doubled
  version of itself
  - otherwise, return the element as-is
- join together the elements in `doubles` and return the resulting string
----------------------------------------------------------
=end

CONSONANTS = (('a'..'z').to_a + ('A'..'Z').to_a).reject! do |letter|
  %w(a e i o u A E I O U).include?(letter)
end

def double_consonants(str)
  doubles = str.chars
  doubles.map! { |char| CONSONANTS.include?(char) ? char * 2 : char }
  doubles.join
end


p double_consonants('String') #== "SSttrrinngg"
p double_consonants("Hello-World!") #== "HHellllo-WWorrlldd!"
p double_consonants("July 4th") #== "JJullyy 4tthh"
p double_consonants('') #== ""