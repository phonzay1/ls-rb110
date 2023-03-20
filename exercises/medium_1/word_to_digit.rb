# Write a method that takes a sentence string as input, and returns the same string
# with any sequence of the words 'zero', 'one', 'two', 'three', 'four', 'five', 'six',
# 'seven', 'eight', 'nine' converted to a string of digits.

=begin
Problem
Inputs:
- a multi-word string
Outputs:
- the same string with words representing single digits (i.e. 'one', 'two', 'three', etc)
converted to string representations of digits (i.e. '1', '2', '3', etc)
Explicit Rules:
Implicit Rules:
Questions?:
- should the original string be mutated, or remain unmodified?
- can I assume that the input words will always be all lowercase? --> account for
different cases just in case
----------------------------------------------------------
Examples
word_to_digit('Please call me at five five five one two three four. Thanks.') == 'Please call me at 5 5 5 1 2 3 4. Thanks.'
----------------------------------------------------------
Data Structure
- a hash to store word to digit conversions
----------------------------------------------------------
Scratch Pad
This solution DOESN'T WORK for words with non-alphabetic characters
- iterate over the words in `words`:
  - if the downcased version of the word with any non-alphabetic characters ignored
  is included in an array of the keys in DIGITS, permanently transform the word to
  the value assigned to its corresponding key in DIGITS
  - otherwise, leave the word as-is
- join the words in `words`, with spaces in between them, and return the resulting
string
----------------------------------------------------------
Algorithm
- initialize a constant DIGITS to a hash with digit word strings as keys, and digit
number strings as values

- split the input string into individual words, contained in an array. Assign this
array to a local variable `words`
- for each word in `words`, iterate through the keys in `DIGITS` to see if part of the
word matches one of the keys in `DIGITS`
  - if there's a match, substitute the part of the `word` that matches the key with
  its corresponding value
  - otherwise, leave it as-is
- join the words in `words`, separated by spaces, and return the resulting string
----------------------------------------------------------
=end

DIGITS = {
  'zero' => '0',
  'one' => '1',
  'two' => '2',
  'three' => '3',
  'four' => '4',
  'five' => '5',
  'six' => '6',
  'seven' => '7',
  'eight' => '8',
  'nine' => '9'
}

def word_to_digit(sentence)
  words = sentence.split
  words.each do |word|
    DIGITS.keys.each do |number_word|
      if /\b#{number_word}\b/.match(word.downcase)
        word.gsub!(/\b#{number_word}\b/, DIGITS[word.downcase.gsub(/[^a-z]/, '')])
      end
    end
  end
  words.join(' ')
end

p word_to_digit('Please call me at five five five one two three four. Thanks.') == 'Please call me at 5 5 5 1 2 3 4. Thanks.'
p word_to_digit('Now enter three.? *four eight. ?nine$#')
p word_to_digit('The number is eight six seven five three zero nine!')