# Write a method that takes a string, and then returns a hash that contains 3 entries:
# one represents the number of characters in the string that are lowercase letters,
# one the number of characters that are uppercase letters, and one the number of
# characters that are neither.

=begin
Problem
Inputs:
- a string
Outputs:
- a hash with 3 key/value pairs, representing the number of lowercase letters in
the string, number of uppercase letters, and number of characters that are neither
Explicit Rules:
Implicit Rules:
- count spaces when counting characters
- even if a string has no occurrence of the given character type, that key should
still exist in the output hash, with a value of 0
Questions?:
----------------------------------------------------------
Examples
letter_case_count('abCdef 123') == { lowercase: 5, uppercase: 1, neither: 4 }
letter_case_count('AbCd +Ef') == { lowercase: 3, uppercase: 3, neither: 2 }
letter_case_count('123') == { lowercase: 0, uppercase: 0, neither: 3 }
letter_case_count('') == { lowercase: 0, uppercase: 0, neither: 0 }
----------------------------------------------------------
Data Structure
----------------------------------------------------------
Scratch Pad
----------------------------------------------------------
Algorithm
- initialize a variable `lettercase_counts` and assign it to a new hash with keys
:lowercase, :uppercase, and :neither, all with values of 0
- iterate through each character in the input string:
  - if it's a lowercase letter (included in the range 'a'..'z'), increment the value of
  `lettercase_counts`[:lowercase] by 1
  - if it's an uppercase letter (included in the range 'A'..'Z'), increment the value of
  `lettercase_counts`[:uppercase] by 1
  - if it's anything else, increment the value of `lettercase_counts`[:neither] by 1
- return `lettercase_counts`
----------------------------------------------------------
=end

# def letter_case_count(str)
#   lettercase_counts = {lowercase: 0, uppercase: 0, neither: 0}
#   str.each_char do |char|
#     if ('a'..'z').include?(char)
#       lettercase_counts[:lowercase] += 1
#     elsif ('A'..'Z').include?(char)
#       lettercase_counts[:uppercase] += 1
#     else
#       lettercase_counts[:neither] += 1
#     end
#   end
#   lettercase_counts
# end
#----WITH REGEX-----------
def letter_case_count(str)
  lettercase_counts = {lowercase: 0, uppercase: 0, neither: 0}
  str.each_char do |char|
    if /[a-z]/.match(char)
      lettercase_counts[:lowercase] += 1
    elsif /[A-Z]/.match(char)
      lettercase_counts[:uppercase] += 1
    else
      lettercase_counts[:neither] += 1
    end
  end
  lettercase_counts
end

p letter_case_count('abCdef 123') == { lowercase: 5, uppercase: 1, neither: 4 }
p letter_case_count('AbCd +Ef') == { lowercase: 3, uppercase: 3, neither: 2 }
p letter_case_count('123') == { lowercase: 0, uppercase: 0, neither: 3 }
p letter_case_count('') == { lowercase: 0, uppercase: 0, neither: 0 }