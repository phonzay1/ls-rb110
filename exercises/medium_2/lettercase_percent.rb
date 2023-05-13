# In the easy exercises, we worked on a problem where we had to count the number
# of uppercase and lowercase characters, as well as characters that were neither
# of those two. Now we want to go one step further.

# Write a method that takes a string, and then returns a hash that contains 3 entries:
# one represents the percentage of characters in the string that are lowercase letters,
# one the percentage of characters that are uppercase letters, and one the percentage of characters that are neither.

# You may assume that the string will always contain at least one character.

=begin
Problem
Inputs:
- a string
Outputs:
- a hash that contains 3 key/value pairs showing the respective percentages of lowercase,
uppercase, and non-alphabetic characters in the input string
Explicit Rules:
Implicit Rules:
- count spaces as characters
- percentages should be represented as >1 float point numbers, rounded to one
decimal point
Questions?:
----------------------------------------------------------
Examples
letter_percentages('abCdef 123') == { lowercase: 50.0, uppercase: 10.0, neither: 40.0 }
letter_percentages('AbCd +Ef') == { lowercase: 37.5, uppercase: 37.5, neither: 25.0 }
letter_percentages('123') == { lowercase: 0.0, uppercase: 0.0, neither: 100.0 }
----------------------------------------------------------
Data Structure
----------------------------------------------------------
Scratch Pad
----------------------------------------------------------
Algorithm
- define a helper method `calculate_percent` that takes two arguments: `numerator`
and `denominator`
  - divide the numerator converted to a float by the denominator,
  multiply by 100, and round to 1 decimal place

- In the main method:
- initialize 3 variables `lowercase_count`, `uppercase_count`, and `non_alpha_count`,
all to 0
- iterate through each character in the input string and check if it's a lowercase,
uppercase, or nonalphabetic character using regex. Increment the corresponding variable
by 1
- initialize a variable `percentages` to an empty hash
  - add the keys `lowercase`, `uppercase`, and `neither` to the hash, each with a value
  of the value returned by invoking the `calculate_percent` method and passing in as
  arguments the correspoding `count` variable and the size of the input string
- return `percentages`
----------------------------------------------------------
=end

def calculate_percent(numerator, denominator)
  ((numerator.to_f / denominator) * 100).round(1)
end

def letter_percentages(str)
  lowercase_count, uppercase_count, non_alpha_count = 0, 0, 0

  str.each_char do |char|
    if /[a-z]/.match(char)
      lowercase_count += 1
    elsif /[A-Z]/.match(char)
      uppercase_count += 1
    else
      non_alpha_count += 1
    end
  end

  percentages = Hash.new(0.0)
  percentages[:lowercase] = calculate_percent(lowercase_count, str.size)
  percentages[:uppercase] = calculate_percent(uppercase_count, str.size)
  percentages[:neither] = calculate_percent(non_alpha_count, str.size)

  percentages
end


p letter_percentages('abCdef 123') == { lowercase: 50.0, uppercase: 10.0, neither: 40.0 }
p letter_percentages('AbCd +Ef') == { lowercase: 37.5, uppercase: 37.5, neither: 25.0 }
p letter_percentages('123') == { lowercase: 0.0, uppercase: 0.0, neither: 100.0 }
p letter_percentages('abcdefGHI')