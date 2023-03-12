# Write a method that takes a String as an argument, and returns a new String that
# contains the original value using a staggered capitalization scheme in which every
# other character is capitalized, and the remaining characters are lowercase.
# Characters that are not letters should not be changed, but count as characters when
# switching between upper and lowercase.

=begin
Problem
Inputs:
- a string
Outputs:
 - a *new* string that's a copy of the original, but with every other character
 capitalized, and the rest lowercase
Explicit Rules:
- non-alphabetic characters should be unchanged, but count as characters when
accounting for "every other"
Implicit Rules:
- characters at even - not odd - indexes should be capitalized
Questions?:
----------------------------------------------------------
Examples
staggered_case('I Love Launch School!') == 'I LoVe lAuNcH ScHoOl!'
staggered_case('ALL_CAPS') == 'AlL_CaPs'
staggered_case('ignore 77 the 444 numbers') == 'IgNoRe 77 ThE 444 NuMbErS'
----------------------------------------------------------
Data Structure
----------------------------------------------------------
Scratch Pad
----------------------------------------------------------
Algorithm
- initialize a variable `characters` and assign it to the result of splitting
the input string into individual characters, contained in an array
- iterate through each character in the array, considering its index:
  - if the index is even, capitalize the character
  - if the index is odd, make the character lowercase
- join the characters in `characters` and return the result of doing so
----------------------------------------------------------
=end

# def staggered_case(str)
#   characters = str.chars
#   characters.each_with_index do |char, idx|
#     idx.even? ? char.upcase! : char.downcase!
#   end
#   characters.join
# end

# p staggered_case('I Love Launch School!') == 'I LoVe lAuNcH ScHoOl!'
# p staggered_case('ALL_CAPS') == 'AlL_CaPs'
# p staggered_case('ignore 77 the 444 numbers') == 'IgNoRe 77 ThE 444 NuMbErS'

#---------FURTHER EXPLORATION-----------------------------
# Can you modify this method so the caller can request that the first character be
# downcased rather than upcased? If the first character is downcased, then the second
# character should be upcased, and so on.

# Hint: Use a keyword argument.

# def staggered_case(str, first_case='u')
#   characters = str.chars
#   puts "Would you like the first character to be upcased or downcased? "\
#   "Enter 'u' for upcase; 'd' for downcase."
#   first_case = gets.chomp

#   case first_case
#   when 'u'
#     characters.each_with_index do |char, idx|
#       idx.even? ? char.upcase! : char.downcase!
#     end
#   when 'd'
#     characters.each_with_index do |char, idx|
#       idx.odd? ? char.upcase! : char.downcase!
#     end
#   else
#     puts "Sorry, that's not a valid response"
#   end

#   characters.join
# end

# p staggered_case('I Love Launch School!')
# p staggered_case('ALL_CAPS')
# p staggered_case('ignore 77 the 444 numbers')
#--------PART 2--------------------------------
# Modify the method from the previous exercise so it ignores non-alphabetic characters
# when determining whether it should uppercase or lowercase each letter. The non-alphabetic
# characters should still be included in the return value; they just don't count when
# toggling the desired case.

=begin
Problem
Inputs:
- a string
Outputs:
- a *new* string that's a copy of the input string, but with every other letter
capitalized and all other letters lowercase (non-alphabetic characters don't count
when toggling back and forth between cases)
Explicit Rules:
Implicit Rules:
Questions?:
----------------------------------------------------------
Examples
staggered_case('I Love Launch School!') == 'I lOvE lAuNcH sChOoL!'
staggered_case('ALL CAPS') == 'AlL cApS'
staggered_case('ignore 77 the 444 numbers') == 'IgNoRe 77 ThE 444 nUmBeRs'
----------------------------------------------------------
Data Structure
----------------------------------------------------------
Scratch Pad
----------------------------------------------------------
Algorithm
- initialize an empty string and assign it to `staggered_case_str`
- initialize a variable need_upcase and assign it to true
- iterate through the characters in the input string:
  - if need_upcase is true, add the upcased version of the character to
  `staggered_case_str`
  - if need_upcase is false, add the downcased version of the character to
  `staggered_case_str`
  - if the character is alphabetic, switch the boolean referenced by `need_upcase`
  to its opposite. Otherwise, leave it as is
- return `staggered_case_str`
----------------------------------------------------------
=end

# def staggered_case(str)
#   staggered_case_str = ''
#   need_upcase = true

#   str.each_char do |char|
#     staggered_case_str << (need_upcase ? char.upcase : char.downcase)
#     need_upcase = (/[a-zA-Z]/.match(char) ? !need_upcase : need_upcase)
#   end

#   staggered_case_str
# end

# p staggered_case('I Love Launch School!') == 'I lOvE lAuNcH sChOoL!'
# p staggered_case('ALL CAPS') == 'AlL cApS'
# p staggered_case('ignore 77 the 444 numbers') == 'IgNoRe 77 ThE 444 nUmBeRs'
#-------FURTHER EXPLORATION----------------------
# Modify this method so the caller can determine whether non-alphabetic characters
# should be counted when determining the upper/lowercase state. That is, you want
# a method that can perform the same actions that this method does, or operates like
# the previous version.

# Hint: Use a keyword argument.

puts "Would you like to count non-alphabetic characters when toggling letter cases? "\
"Enter 'y' for yes, 'n' for no."
count_non_alpha = gets.chomp

def staggered_case(str, count_non_alpha='y')
  staggered_case_str = ''
  need_upcase = true

  if count_non_alpha.downcase.start_with?('y')
    str.each_char do |char|
    staggered_case_str << (need_upcase ? char.upcase : char.downcase)
    need_upcase = !need_upcase
    end
  elsif count_non_alpha.downcase.start_with?('n')
    str.each_char do |char|
    staggered_case_str << (need_upcase ? char.upcase : char.downcase)
    need_upcase = (/[a-zA-Z]/.match(char) ? !need_upcase : need_upcase)
    end
  else
    puts "Sorry, that's not a valid response"
  end

  staggered_case_str
end

p staggered_case('I Love Launch School!', count_non_alpha)
p staggered_case('ALL CAPS', count_non_alpha)
p staggered_case('ignore 77 the 444 numbers', count_non_alpha)