# Write a method that returns a list of all substrings of a string that start at the
# beginning of the original string. The return value should be arranged in order from
# shortest to longest substring.

=begin
Problem
Inputs:
- a string
Outputs:
- an array of all substrings of a string that start at the beginning of the original
string, listed in order from shortest to longest substring
Explicit Rules:
Implicit Rules:
- the full input string itself is considered a "substring"
Questions?:
- should an empty input string return an empty array?
----------------------------------------------------------
Examples
leading_substrings('abc') == ['a', 'ab', 'abc']
leading_substrings('a') == ['a']
leading_substrings('xyzzy') == ['x', 'xy', 'xyz', 'xyzz', 'xyzzy']
----------------------------------------------------------
Data Structure
----------------------------------------------------------
Scratch Pad
- initialize an empty array to hold the substrings
- use `Integer#upto` method to iterate through the input string, and create slices of it
----------------------------------------------------------
Algorithm
- initialize an empty array to hold the substrings
- iterate through each character of the input string
  - add a substring starting from the first character of the input string, going
  through the current character, to the empty array
- return the array
----------------------------------------------------------
=end

# def leading_substrings(str)
#   substrings = []
#   1.upto(str.size) {|number_chars| substrings << str.slice(0, number_chars)}
#   substrings
# end

# p leading_substrings('abc') == ['a', 'ab', 'abc']
# p leading_substrings('a') == ['a']
# p leading_substrings('xyzzy') == ['x', 'xy', 'xyz', 'xyzz', 'xyzzy']

#----ALL SUBSTRINGS SMALL PROBLEM---------------
# Write a method that returns a list of all substrings of a string. The returned
# list should be ordered by where in the string the substring begins. This means that
# all substrings that start at position 0 should come first, then all substrings that
# start at position 1, and so on. Since multiple substrings will occur at each position,
# the substrings at a given position should be returned in order from shortest to longest.

# You may (and should) use the leading_substrings method you wrote in the previous exercise

=begin
Problem
Inputs:
- a string
Outputs:
- an array containing all possible substrings of the input string, ordered by: 1)
where in the string they occur, and b) by length from shortest to longest
Explicit Rules:
Implicit Rules:
Questions?:
- how to handle empty string inputs?
----------------------------------------------------------
Examples
substrings('abcde') == [
  'a', 'ab', 'abc', 'abcd', 'abcde',
  'b', 'bc', 'bcd', 'bcde',
  'c', 'cd', 'cde',
  'd', 'de',
  'e'
]
----------------------------------------------------------
Data Structure
----------------------------------------------------------
Scratch Pad
- use the `leading_substrings` method on subsections of the input string. Each
time this is done will create a new array, so add this array to an overall array
and then flatten it
  - for these subsections: take slices from indices (0-(str.size-1)) - (str.size-1)
----------------------------------------------------------
Algorithm
- initialize a variable `all_substrings` and assign it to an empty array
- initialize a variable `start_index` and assign it to 0
- initialize a loop:
  - run the `leading_substrings` method with a slice of the input string from
  `start_index` to the size of the string - 1 passed in as an argument
  - add the array returned from `leading_substrings` to `all_substrings`
  - increment `start_index` by 1
  - break if `start_index` == size of the input string
- return `all_substrings`, flattened to a one-dimensional array
----------------------------------------------------------
=end

# def substrings(str)
#   all_substrings = []
#   start_index = 0

#   loop do
#     break if start_index == str.size
#     all_substrings << leading_substrings(str[start_index..(str.size-1)])
#     start_index += 1
#   end

#   all_substrings.flatten
# end

# p substrings('abcde') == [
#   'a', 'ab', 'abc', 'abcd', 'abcde',
#   'b', 'bc', 'bcd', 'bcde',
#   'c', 'cd', 'cde',
#   'd', 'de',
#   'e'
# ]

#--------PALINDROMIC SUBSTRINGS SMALL PROBLEM-----------------------
# Write a method that returns a list of all substrings of a string that are palindromic.
# That is, each substring must consist of the same sequence of characters forwards as
# it does backwards. The return value should be arranged in the same sequence as the
# substrings appear in the string. Duplicate palindromes should be included multiple times.

# You may (and should) use the substrings method you wrote in the previous exercise.

# For the purposes of this exercise, you should consider all characters and pay attention
# to case; that is, "AbcbA" is a palindrome, but neither "Abcba" nor "Abc-bA" are.
# In addition, assume that single characters are not palindromes.

=begin
Problem
Inputs:
- a string
Outputs:
- an array of all substrings of the input string that are palindromic
Explicit Rules:
- the returned array should be listed in the order that the substrings appear in the string
- duplicate palindromes should be included multiple times
- non-alphabetic characters, and case of characters, should be considered when
determining palindromes
- single characters are NOT palindromes
Implicit Rules:
- the method should return an empty array if the input string contains no palindromes
Questions?:
----------------------------------------------------------
Examples
palindromes('abcd') == []
palindromes('madam') == ['madam', 'ada']
palindromes('hello-madam-did-madam-goodbye') == [
  'll', '-madam-', '-madam-did-madam-', 'madam', 'madam-did-madam', 'ada',
  'adam-did-mada', 'dam-did-mad', 'am-did-ma', 'm-did-m', '-did-', 'did',
  '-madam-', 'madam', 'ada', 'oo'
]
palindromes('knitting cassettes') == [
  'nittin', 'itti', 'tt', 'ss', 'settes', 'ette', 'tt'
]
----------------------------------------------------------
Data Structure
----------------------------------------------------------
Scratch Pad
----------------------------------------------------------
Algorithm
- use the `substrings` method to find all possible substrings from the input string,
and assign the array of these substrings to a variable `all_substrings`
- select all substrings from `all_substrings` for which the following are true:
the substring is equal to itself reversed, and the substring is greater than
one character. Return an array containing these substrings
----------------------------------------------------------
=end

# def palindromes(str)
#   all_substrings = substrings(str)
#   all_substrings.select do |substring|
#     substring == substring.reverse && substring.size > 1
#   end
# end

# p palindromes('abcd') == []
# p palindromes('madam') == ['madam', 'ada']
# p palindromes('hello-madam-did-madam-goodbye') == [
#   'll', '-madam-', '-madam-did-madam-', 'madam', 'madam-did-madam', 'ada',
#   'adam-did-mada', 'dam-did-mad', 'am-did-ma', 'm-did-m', '-did-', 'did',
#   '-madam-', 'madam', 'ada', 'oo'
# ]
# p palindromes('knitting cassettes') == [
#   'nittin', 'itti', 'tt', 'ss', 'settes', 'ette', 'tt'
# ]

#----------FURTHER EXPLORATION-------------------
# Can you modify this method (and/or its predecessors) to ignore non-alphanumeric
# characters and case? Alphanumeric characters are alphabetic characters(upper and
# lowercase) and digits.

def leading_substrings(str)
  substrings = []
  1.upto(str.size) {|number_chars| substrings << str.slice(0, number_chars)}
  substrings
end

def substrings(str)
  all_substrings = []
  start_index = 0

  loop do
    break if start_index == str.size
    all_substrings << leading_substrings(str[start_index..(str.size-1)])
    start_index += 1
  end

  all_substrings.flatten
end

def palindrome?(str)
  str == str.reverse && str.size > 1
end

def palindromes(str)
  all_substrings = substrings(str)
  clean_substrings = all_substrings.map do |substring|
                       substring.gsub(/[^a-zA-Z0-9]/, '').downcase
                     end

  palindrome_substrings = []
  clean_substrings.each_with_index do |substr, index|
    palindrome_substrings << all_substrings[index] if palindrome?(substr)
  end
  palindrome_substrings
end

p palindromes('AbcCBa')
p palindromes('M-a*d&A?m')