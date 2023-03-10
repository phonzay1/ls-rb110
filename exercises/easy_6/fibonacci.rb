# The Fibonacci series is a series of numbers (1, 1, 2, 3, 5, 8, 13, 21, ...) such
# that the first 2 numbers are 1 by definition, and each subsequent number is the
# sum of the two previous numbers. This series appears throughout the natural world.

# Computationally, the Fibonacci series is a very simple series, but the results
# grow at an incredibly rapid rate. For example, the 100th Fibonacci number is
# 354,224,848,179,261,915,075 -- that's enormous, especially considering that it
# takes 6 iterations before it generates the first 2 digit number.

# Write a method that calculates and returns the index of the first Fibonacci number
# that has the number of digits specified as an argument. (The first Fibonacci number has index 1.)

=begin
Problem
Inputs:
- number of digits, >= 2
Outputs:
- the index of the first Fibonacci number that has the input number of digits
Explicit Rules:
- the first Fibonacci number has index 1
- You may assume that the argument is always greater than or equal to 2.
Implicit Rules:
Questions?:
----------------------------------------------------------
Examples
find_fibonacci_index_by_length(2) == 7          # 1 1 2 3 5 8 13
find_fibonacci_index_by_length(3) == 12         # 1 1 2 3 5 8 13 21 34 55 89 144
find_fibonacci_index_by_length(10) == 45
find_fibonacci_index_by_length(100) == 476
find_fibonacci_index_by_length(1000) == 4782
find_fibonacci_index_by_length(10000) == 47847
----------------------------------------------------------
Data Structure
----------------------------------------------------------
Scratch Pad
----------------------------------------------------------
Algorithm
- initialize a variable, `fibonacci_nums`, and assign it to this array: [1, 1]
- Create a loop to add numbers to `fibonacci_nums`:
  - append fibonacci_nums[-2] + fibonacci_nums[-1] to `fibonacci_nums`
  - break if the number of digits in the last array element is == to the input
  integer
  - return the index of the last element in `fibonacci_nums` + 1
----------------------------------------------------------
=end

def find_fibonacci_index_by_length(number_of_digits)
  fibonacci_nums = [1, 1]

  loop do
    fibonacci_nums << (fibonacci_nums[-2] + fibonacci_nums[-1])
    break if fibonacci_nums.last.digits.size >= number_of_digits
  end

  fibonacci_nums.index(fibonacci_nums.last) + 1
end

p find_fibonacci_index_by_length(2) == 7          # 1 1 2 3 5 8 13
p find_fibonacci_index_by_length(3) == 12         # 1 1 2 3 5 8 13 21 34 55 89 144
p find_fibonacci_index_by_length(10) == 45
p find_fibonacci_index_by_length(100) == 476
p find_fibonacci_index_by_length(1000) == 4782
p find_fibonacci_index_by_length(10000) #== 47847