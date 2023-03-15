# Write a method that takes two arguments: the first is the starting number, and the
# second is the ending number. Print out all numbers from the starting number to the
# ending number, except if a number is divisible by 3, print "Fizz", if a number is
# divisible by 5, print "Buzz", and finally if a number is divisible by 3 and 5, print "FizzBuzz".

=begin
Problem
Inputs:
- two numbers: a starting number and an ending number
Outputs:
- print all numbers from the starting to the ending number, but replace multiples of 3
with the string 'Fizz', multiples of 5 with the string 'Buzz', and numbers that are
multiples of both 3 and 5 with the string 'FizzBuzz'
Explicit Rules:
Implicit Rules:
Questions?:
- does it matter how the numbers and strings are formatted when they're printed?
ex. is it ok if they're on separate lines, or should they all be on one line (if possible)
separated by commas
----------------------------------------------------------
Examples
fizzbuzz(1, 15) # -> 1, 2, Fizz, 4, Buzz, Fizz, 7, 8, Fizz, Buzz, 11, Fizz, 13, 14, FizzBuzz
----------------------------------------------------------
Data Structure
----------------------------------------------------------
Scratch Pad
- start_num.upto(end_num) { |num| if...elsif...else }
----------------------------------------------------------
Algorithm
- iterate through each number from the input starting number, to the input ending
number
  - if a number is a multiple of both 3 and 5 print 'FizzBuzz'
  - if a number is a multiple of just 3, print 'Fizz'
  - if a number is a multiple of just 5, print 'Buzz'
  - otherwise, print the number
----------------------------------------------------------
=end

def fizzbuzz(start_num, end_num)
  start_num.upto(end_num) do |num|
    if num % 3 == 0 && num % 5 == 0
      puts 'FizzBuzz'
    elsif num % 3 == 0
      puts 'Fizz'
    elsif num % 5 == 0
      puts 'Buzz'
    else
      puts num
    end
  end
end

fizzbuzz(1, 15)
fizzbuzz(15, 30)
fizzbuzz(45, 75)