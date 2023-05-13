# def neutralize(sentence)
#   words = sentence.split(' ')
#   words.each do |word|
#     words.delete(word) if negative?(word)
#   end

#   words.join(' ')
# end

# def negative?(word)
#   [ 'dull',
#     'boring',
#     'annoying',
#     'chaotic'
#   ].include?(word)
# end

# puts neutralize('These dull boring cards are part of a chaotic board game.')
# Expected: These cards are part of a board game.
# Actual: These boring cards are part of a board game.

=begin
We wrote a neutralize method that removes negative words from sentences. However,
it fails to remove all of them. What exactly happens?

Within the `neutralize` method definition on lines 1-8 (indicated by the `def..end`),
local variable `words` is initialized on line 2 to an array of the words within the
string referenced by the method local variable `sentence`, which is passed to the
`neutralize` method as an argument. Then on lines 3-5, the `each` method is called
with a block (indicated by the `do..end`) on the array referenced by `words`. The
`each` method passes each array element to the block, with the block parameter `word`
referencing each element in turn. On line 4 within the `each` method call, the array
referenced by `words` is being mutated as it's being iterated over: if an array
element returns `true` when passed to the `negative?` method as an argument, then
it is deleted from the array referenced by `words`.

Thus in the example sentence here, the `each` method call on lines 3-5 iterates through
an array of the words in the sentence, and deletes the word at index 1: 'boring'.
Then the `each` method continues on to the word at index 2, which is now 'cards',
so the word 'boring' gets skipped over because we're mutating the array during
iteration.

An alternate solution that deletes all of the "negative" words is coded below.
=end

require 'pry'

def neutralize(sentence)
  words = sentence.split(' ')
  words.delete_if { |word| binding.pry; negative?(word) }
  words.join(' ')
end

def negative?(word)
  [ 'dull',
    'boring',
    'annoying',
    'chaotic'
  ].include?(word)
end

puts neutralize('These dull boring cards are part of a chaotic board game.')