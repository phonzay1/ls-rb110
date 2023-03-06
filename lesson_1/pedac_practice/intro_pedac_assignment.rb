# PROBLEM:

# Given a string, write a method `palindrome_substrings` which returns
# all the substrings from a given string which are palindromes. Consider
# palindrome words case sensitive.

# Test cases:

# palindrome_substrings("supercalifragilisticexpialidocious") == ["ili"]
# palindrome_substrings("abcddcbA") == ["bcddcb", "cddc", "dd"]
# palindrome_substrings("palindrome") == []
# palindrome_substrings("") == []

=begin
Problem
Input: a string
Output: an array containing all of the substrings of the input string that are palindromes
Explicit Rules:
- Palindrome words are case sensitive (i.e. 'dd' is a palindrome but 'Dd' is not)
- palindrome substrings should be returned by the method, not output
Implicit Rules:
- an empty string should return an empty array
- a string with no palindrome substrings should return an empty array
=end