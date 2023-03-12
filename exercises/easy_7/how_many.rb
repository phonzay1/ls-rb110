# Write a method that counts the number of occurrences of each element in a given array.

# The words in the array are case-sensitive: 'suv' != 'SUV'. Once counted, print
# each element alongside the number of occurrences.

=begin
Problem
Inputs:
- an array
Outputs:
- print each element along with how many times it occurs in the array
Explicit Rules:
- words in the array are case-sensitive, i.e. 'car' != 'CAR'
Implicit Rules:
Questions?:
- what should be output if the input is an empty array?
----------------------------------------------------------
Examples
vehicles = [
  'car', 'car', 'truck', 'car', 'SUV', 'truck',
  'motorcycle', 'motorcycle', 'car', 'truck'
]

count_occurrences(vehicles)

# Expected output:
car => 4
truck => 3
SUV => 1
motorcycle => 2
----------------------------------------------------------
Data Structure
- use a hash to keep track of unique keys and how many times they occur
----------------------------------------------------------
Scratch Pad
----------------------------------------------------------
Algorithm
- initialize a variable `counts` and assign it to a new hash that defaults to returning
the value 0 if an uninitialized key is referenced
- iterate through the input array:
  - for each array element:
    - if it hasn't already been added as a key in `counts`, add it and set its value to 1
    - if it has already been added as a key, increment its value by 1
- print each key/value pair
----------------------------------------------------------
=end

# def count_occurrences(arr)
#   counts = Hash.new(0)
#   arr.each { |el| counts[el] += 1 }
#   counts.each { |key, value| puts "#{key} => #{value}"}
# end

# vehicles = [
#   'car', 'car', 'truck', 'car', 'SUV', 'truck',
#   'motorcycle', 'motorcycle', 'car', 'truck'
# ]

# count_occurrences(vehicles)

# Expected output:
# car => 4
# truck => 3
# SUV => 1
# motorcycle => 2
#------------FURTHER EXPLORATION------------------
# Try to solve the problem when words are case insensitive, e.g. "suv" == "SUV".

def count_occurrences(arr)
  counts = Hash.new(0)
  arr.each { |el| counts[el.downcase] += 1 }
  counts.each { |key, value| puts "#{key} => #{value}"}
end

vehicles = [
  'car', 'car', 'truck', 'car', 'SUV', 'truck',
  'motorcycle', 'motorcycle', 'car', 'truck',
  'suv', 'sUv'
]

count_occurrences(vehicles)