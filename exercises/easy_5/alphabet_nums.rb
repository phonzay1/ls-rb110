# Write a method that takes an Array of Integers between 0 and 19, and returns an
# Array of those Integers sorted based on the English words for each number:

# zero, one, two, three, four, five, six, seven, eight, nine, ten, eleven, twelve,
# thirteen, fourteen, fifteen, sixteen, seventeen, eighteen, nineteen

=begin
Problem
Inputs:
- an array of integers between 0-19
Outputs:
- an array of the input integers, sorted from a-z based on the English words for
each number
Explicit Rules:
Implicit Rules:
- a new array is being returned, not a modified version of the original array
Questions?:
----------------------------------------------------------
Examples
alphabetic_number_sort((0..19).to_a) == [
  8, 18, 11, 15, 5, 4, 14, 9, 19, 1, 7, 17,
  6, 16, 10, 13, 3, 12, 2, 0
]
----------------------------------------------------------
Data Structure
----------------------------------------------------------
Scratch Pad
----------------------------------------------------------
Algorithm
- initialize a constant `INTEGER_NAMES` and assign it to a hash with the integers
from 0-19 as keys, and their equivalent names in English (strings) as values
- initialize an empty hash, `numbers`
- iterate over the input array and add each integer as a key in `numbers`, with
its string equivalent as its value
- sort the items in 'numbers' by the alphabetical order (a-z) of the values. Assign the
sorted return value to `sorted_array`
- flatten `sorted_array` to a one-dimensional (not nested) array
- delete all elements from `sorted_array` that aren't integers
- return the array
----------------------------------------------------------
=end

# INTEGER_NAMES = {
#   0 => 'zero',
#   1 => 'one',
#   2 => 'two',
#   3 => 'three',
#   4 => 'four',
#   5 => 'five',
#   6 => 'six',
#   7 => 'seven',
#   8 => 'eight',
#   9 => 'nine',
#   10 => 'ten',
#   11 => 'eleven',
#   12 => 'twelve',
#   13 => 'thirteen',
#   14 => 'fourteen',
#   15 => 'fifteen',
#   16 => 'sixteen',
#   17 => 'seventeen',
#   18 => 'eighteen',
#   19 => 'nineteen'
# }

# def alphabetic_number_sort(integer_array)
#   numbers = integer_array.each_with_object({}) do |number, hsh|
#     hsh[number] = INTEGER_NAMES[number]
#   end

#   sorted_array = (numbers.sort_by {|_, name| name}).flatten.select {|el| Integer(el, exception: false)}
#   sorted_array
# end

# p alphabetic_number_sort((0..19).to_a) == [
#   8, 18, 11, 15, 5, 4, 14, 9, 19, 1, 7, 17,
#   6, 16, 10, 13, 3, 12, 2, 0
# ]
#---------------FURTHER EXPLORATION----------------------
# Why do you think we didn't use Array#sort_by! instead of Enumerable#sort_by?
# To avoid mutating the original array that's passed in as an argument

# For an extra challenge, rewrite your method to use Enumerable#sort (unless you already did so).

NUMBER_WORDS = %w(zero one two three four
                  five six seven eight nine
                  ten eleven twelve thirteen fourteen
                  fifteen sixteen seventeen eighteen nineteen)

def alphabetic_number_sort(numbers)
  sorted_num_names = numbers.map {|number| NUMBER_WORDS[number]}.sort
  sorted_nums = []
  sorted_num_names.each {|num| sorted_nums << NUMBER_WORDS.index(num)}
  sorted_nums
end

p alphabetic_number_sort((0..19).to_a) #== [
#   8, 18, 11, 15, 5, 4, 14, 9, 19, 1, 7, 17,
#   6, 16, 10, 13, 3, 12, 2, 0
# ]