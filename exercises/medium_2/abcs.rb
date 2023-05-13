# A collection of spelling blocks has two letters per block, as shown in the list below.
# This limits the words you can spell with the blocks to just those words that do
# not use both letters from any given block. Each letter in each block can only be used once.

# Write a method that returns true if the word passed in as an argument can be spelled
# from this set of blocks, false otherwise.

=begin
Problem
Inputs:
- a word, and a set of "spelling blocks"
Outputs:
- a boolean based on whether the argument word can be spelled using the set of
spelling blocks
Explicit Rules:
Implicit Rules:
- the result should ignore case in both the spelling blocks and input word
Questions?:
----------------------------------------------------------
Examples
block_word?('BATCH') == true
block_word?('BUTCH') == false
block_word?('jest') == true
----------------------------------------------------------
Data Structure
- use a nested array structure to contain the spelling blocks and iterate over them
----------------------------------------------------------
Scratch Pad
----------------------------------------------------------
Algorithm
- initialize a constant SPELLING_BLOCKS and assign it to an array containing sub-arrays
that each contain two elements: two UPPERCASE strings that are the letters of a spelling block
- split the input word into an array of its characters, all uppercase. Assign this
array to a variable `chars`
- Iterate over the sub-arrays in SPELLING_BLOCKS and test if any of them meet the
following condition: *all* of the elements in the sub-array are included in `chars`
  - If this returns true for any of the SPELLING_BLOCKS sub-arrays, return false
  from the method
  - otherwise, return true
----------------------------------------------------------
=end

SPELLING_BLOCKS = [['B', 'O'], ['X', 'K'], ['D', 'Q'], ['C', 'P'], ['N', 'A'],
                  ['G', 'T'], ['R', 'E'], ['F', 'S'], ['J', 'W'], ['H', 'U'],
                  ['V', 'I'], ['L', 'Y'], ['Z', 'M']]

# def block_word?(word)
#   chars = word.upcase.chars
#   !(SPELLING_BLOCKS.any? do |block|
#     block.all? { |letter| chars.include?(letter) }
#   end)
# end

# The method above doesn't check if a single spelling block letter is used more
# than once - the method below does

def block_word?(word)
  chars = word.upcase.chars
  !(SPELLING_BLOCKS.any? do |block|
    sum = 0
    block.each { |letter| sum += chars.count(letter) }
    sum >= 2
  end)
end

# p block_word?('BATCH') == true
# p block_word?('BUTCH') == false
# p block_word?('jest') == true
p block_word?('hatch')