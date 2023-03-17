# Given the array below, write a program that prints out groups of words that are anagrams.
# Anagrams are words that have the same exact letters in them but in a different order.
# Your output should look something like this:

# ["demo", "dome", "mode"]
# ["neon", "none"]
# #(etc)

=begin
Problem
Inputs:
- an array of words that contains several sets of anagrams, that are not currently
grouped together
Outputs:
- printed out arrays that each contain a different set of anagrams from the input
array
Explicit Rules:
Implicit Rules:
Questions?:
----------------------------------------------------------
Examples
# ["demo", "dome", "mode"]
# ["neon", "none"]
# #(etc)
----------------------------------------------------------
Data Structure
----------------------------------------------------------
Scratch Pad
- split each string in the input array into its individual characters, contained
in subarrays (with each set of characters at the same index in the enclosing array
as the original word in the input array) - transformation
- sort each subarray alphabetically
- search for subarrays that are equivalent, and add the words at the corresponding
indices from the input array to a new, empty array.
----------------------------------------------------------
Algorithm
- initialize a local variable `letters` and assign it to the result of transforming
the input array in the following way:
  - split each string into an array of its individual characters, sorted alphabetically
- initialize a local variable `anagrams` and assign it to an empty array
- initialize a local variable `counter` and assign it to 0
- initialize a loop:
  - break if `counter` == `letters`.size
  - iterate over `letters`, considering each array element's index
    - initialize a local variable `anagram_set` and assign it to an empty array
    - initialize a local variable `comparison_arr` and assign it to letters[counter]
    - for each element in `letters`, if it's equivalent to `comparison_word`, then add
    the array element from the input array at that index to `anagram_set`
    - add `anagram_set` to `anagrams`
    - increment `counter` by 1
- iterate over `anagrams`, sorting each sub-array alphabetically
- remove duplicate values from `anagrams`
- print out each array element of `anagrams`
----------------------------------------------------------
=end

words =  ['demo', 'none', 'tied', 'evil', 'dome', 'mode', 'live',
          'fowl', 'veil', 'wolf', 'diet', 'vile', 'edit', 'tide',
          'flow', 'neon']

def display_anagrams(words_arr)
  letters = words_arr.map { |word| word.chars.sort }
  anagrams = []
  counter = 0

  loop do
    break if counter == letters.size
    comparison_arr = letters[counter]
    anagram_set = []

    letters.each_with_index do |letters_arr, index|
      anagram_set << words_arr[index] if comparison_arr == letters_arr
      anagrams << anagram_set if !(anagram_set.empty?)
    end

    counter += 1
  end

  anagrams.each { |sub_arr| sub_arr.sort! }
  anagrams.uniq!
  anagrams.each { |anagram_list| p anagram_list }
end

display_anagrams(words)

# This solution works, but it is *messy*! It goes through a lot of work to create
# a huge array containing lots of duplicates, and then just removes those duplicates
# - they serve no ultimate purpose, and it takes time/computing power to iterate through and
# add them to the `anagrams` array