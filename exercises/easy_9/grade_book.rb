# Write a method that determines the mean (average) of the three scores passed to it,
# and returns the letter value associated with that grade.

# Tested values are all between 0 and 100. There is no need to check for negative
# values or values greater than 100.

=begin
Problem
Inputs:
- 3 numbers between 0-100
Outputs:
- the letter value of the grade associated with the average of the 3 input numbers
Explicit Rules:
Implicit Rules:
Questions?:
- can we assume that the input numbers will always be integers?
----------------------------------------------------------
Examples
get_grade(95, 90, 93) == "A"
get_grade(50, 50, 95) == "D"
----------------------------------------------------------
Data Structure
----------------------------------------------------------
Scratch Pad
- initialize a constant to a hash to hold the corresponding number/letter grade values
----------------------------------------------------------
Algorithm
- initialize a constant `GRADES` to a 2-D array with two-element sub-arrays to hold number/letter grade values
(letter grades are the first element in each subarray, and ranges are the second element in each subarray)
- initialize a local variable `average` and assign it to the average of the 3 input numbers
- iterate over each subarray in `GRADES` and check if `average` is included in the range
element (the second element in the subarray). If so, return the first element in the subarray
----------------------------------------------------------
=end

# GRADES = [
#   ['A', (90..100)],
#   ['B', (80...90)],
#   ['C', (70...80)],
#   ['D', (60...70)],
#   ['F', (0...60)]
# ]

# def get_grade(grade1, grade2, grade3)
#   average = (grade1 + grade2 + grade3) / 3
#   letter_grade = ''
#   GRADES.each do |sub_arr|
#     letter_grade = sub_arr[0] if sub_arr[1].include?(average)
#   end
#   letter_grade
# end

# p get_grade(95, 90, 93) == "A"
# p get_grade(50, 50, 95) == "D"
#----------FURTHER EXPLORATION------------------
# How would you handle this if there was a possibility of extra credit grades
# causing it to exceed 100 points?

GRADES = [
  ['A+', (100..)],
  ['A', (90..100)],
  ['B', (80...90)],
  ['C', (70...80)],
  ['D', (60...70)],
  ['F', (0...60)]
]

def get_grade(grade1, grade2, grade3)
  average = (grade1 + grade2 + grade3) / 3
  letter_grade = ''
  GRADES.each do |sub_arr|
    letter_grade = sub_arr[0] if sub_arr[1].include?(average)
  end
  letter_grade
end

p get_grade(101, 110, 112)