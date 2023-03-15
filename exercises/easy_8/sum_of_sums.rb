# Write a method that takes an Array of numbers and then returns the sum of the sums
# of each leading subsequence for that Array. You may assume that the Array always
# contains at least one number.

=begin
Problem
Inputs:
- an array of numbers, with at least one number
Outputs:
- an integer: the sum of the sums of each leading subsequence for that array
Explicit Rules:
Implicit Rules:
- an array of one number returns that number
Questions?:
----------------------------------------------------------
Examples
sum_of_sums([3, 5, 2]) == (3) + (3 + 5) + (3 + 5 + 2) # -> (21)
sum_of_sums([1, 5, 7, 3]) == (1) + (1 + 5) + (1 + 5 + 7) + (1 + 5 + 7 + 3) # -> (36)
sum_of_sums([4]) == 4
sum_of_sums([1, 2, 3, 4, 5]) == 35
----------------------------------------------------------
Data Structure
----------------------------------------------------------
Scratch Pad
----------------------------------------------------------
Algorithm
- initialize a variable `total_sum` and assign it to 0
- initialize a variable `number_of_nums` and assign it to 1
- initialize a loop
  - take a subsection of the input array, starting at index 0 and containing
  `number_of_nums` number of items
  - add together all of the numbers in that array subsection
  - add this subsection sum to `total_sum`
  - increment `number_of_nums` by 1
  - break if `number_of_nums` > the number of elements in the input array
- return `total_sum`
----------------------------------------------------------
=end

def sum_of_sums(arr)
  total_sum = 0
  number_of_nums = 1

  loop do
    total_sum += arr[0, number_of_nums].inject(:+)
    number_of_nums += 1
    break if number_of_nums > arr.size
  end

  total_sum
end

p sum_of_sums([3, 5, 2]) #== (3) + (3 + 5) + (3 + 5 + 2) # -> (21)
p sum_of_sums([1, 5, 7, 3]) #== (1) + (1 + 5) + (1 + 5 + 7) + (1 + 5 + 7 + 3) # -> (36)
p sum_of_sums([4]) #== 4
p sum_of_sums([1, 2, 3, 4, 5]) #== 35