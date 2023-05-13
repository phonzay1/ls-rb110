# Write a program that reads the content of a text file and then prints the longest
# sentence in the file based on number of words. Sentences may end with periods (.),
# exclamation points (!), or question marks (?). Any sequence of characters that are
# not spaces or sentence-ending characters should be treated as a word. You should
# also print the number of words in the longest sentence.

=begin
Problem
Inputs:
- a text file with multiple sentences
Outputs:
- printed out: the longest sentence in the input file (based on # of words), and
the number of words in that sentence
Explicit Rules:
- Sentences can end with periods, exclamation points, or question marks
- *any* sequence of non-space/non-sentence ending punctuation should be counted as
a word
Implicit Rules:
Questions?:
----------------------------------------------------------
Examples
----------------------------------------------------------
Data Structure
- array - to hold lists of words in sentences
----------------------------------------------------------
Scratch Pad
- split text into an array of sentences: sentences = text.split(/\.|\?|!/)
----------------------------------------------------------
Algorithm
- split the input text into an array of sentences, assigned to a variable `sentences`
- iterate over `sentences`, permanently transforming each sentence string into an array of the
words in that sentence
- initialize a local variable `longest_sentence_index` to 0
- iterate over `sentences` with indexes
  - for each sentence array, compare the number of words contained in the array with the
  number of words contained in the `sentences` array element at the index indicated
  by `longest_sentence_index`
    - if the current sentence has equal to or more words, reassign `longest_sentence_index`
    to the current index number
- print out the words contained in `sentences[longest_sentence_index]`, joined by spaces,
as well as the number of words in that sentence
----------------------------------------------------------
=end

def print_longest_sentence(file)
  sentences = file.split(/\.|\?|!/).map do |string|
    string.split
  end

  longest_sentence_index = 0
  sentences.each_with_index do |sentence_arr, index|
    longest_sentence_index = index if sentence_arr.size >= sentences[longest_sentence_index].size
  end

  puts "The longest sentence in this text is: \"#{sentences[longest_sentence_index].join(' ')}\"." \
  " This sentence contains #{sentences[longest_sentence_index].size} words."
end

puts "What file would you like to read?"
file_name = gets.chomp

file = File.read("#{file_name}")
print_longest_sentence(file)