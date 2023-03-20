# Write a method that rotates an array by moving the first element to the end of
# the array. The original array should not be modified.

# Do not use the method Array#rotate or Array#rotate! for your implementation.

=begin
Problem
Inputs:
- an array
Outputs:
- a *new* array that's a copy of the input array, but with the first element moved
to the end of the array
Explicit Rules:
- do not modify the original array!
Implicit Rules:
Questions?:
- should an empty array return an empty array?
----------------------------------------------------------
Examples
rotate_array([7, 3, 5, 2, 9, 1]) == [3, 5, 2, 9, 1, 7]
rotate_array(['a', 'b', 'c']) == ['b', 'c', 'a']
rotate_array(['a']) == ['a']

x = [1, 2, 3, 4]
rotate_array(x) == [2, 3, 4, 1]   # => true
x == [1, 2, 3, 4]                 # => true
----------------------------------------------------------
Data Structure
----------------------------------------------------------
Scratch Pad
----------------------------------------------------------
Algorithm
- initialize a variable `rotated_arr` and assign it to a copy of the input array
- initialize a variable `first_el`, and assign it to the first element of `rotated_arr`.
Remove the first element of `rotated_arr`
- append `first_el` to `rotated_arr`
- return `rotated_arr`
----------------------------------------------------------
=end

def rotate_array(arr)
  rotated_arr = arr.dup
  first_el = rotated_arr.shift
  rotated_arr << first_el
end

# p rotate_array([7, 3, 5, 2, 9, 1])  == [3, 5, 2, 9, 1, 7]
# p rotate_array(['a', 'b', 'c']) == ['b', 'c', 'a']
# p rotate_array(['a']) == ['a']

# x = [1, 2, 3, 4]
# p rotate_array(x) == [2, 3, 4, 1]   # => true
# p x == [1, 2, 3, 4]                 # => true

#-----FURTHER EXPLORATION-------------------------
# Write a method that rotates a string instead of an array. Do the same thing for
# integers. You may use rotate_array from inside your new method.

def rotate_str(str)
  str[1..-1] + str[0]
end

# herb = 'basil'
# puts rotate_str(herb)
# puts herb

# def rotate_int(int)
#   str_int = int.to_s
#   rotate_str(str_int).to_i
# end

# num = 123456789
# puts rotate_int(num)
# puts num
#--------PART 2----------------------------------
# Write a method that can rotate the last n digits of a number.
# Note that rotating just 1 digit results in the original number being returned.
# You may use the rotate_array method from the previous exercise if you want. (Recommended!)
# You may assume that n is always a positive integer.

=begin
Problem
Inputs:
- a number, and a positive integer(n) indicating how many of the number's (last) digits
to rotate
Outputs:
- the input number with its last n digits rotated
Explicit Rules:
Implicit Rules:
Questions?:
----------------------------------------------------------
Examples
rotate_rightmost_digits(735291, 1) == 735291
rotate_rightmost_digits(735291, 2) == 735219
rotate_rightmost_digits(735291, 3) == 735912
rotate_rightmost_digits(735291, 4) == 732915
rotate_rightmost_digits(735291, 5) == 752913
rotate_rightmost_digits(735291, 6) == 352917
----------------------------------------------------------
Data Structure
- convert the number to a string or an array in order to work with its individual
digits
----------------------------------------------------------
Scratch Pad
----------------------------------------------------------
Algorithm
- convert the input number to a string and assign it to a variable `str_num`
- initialize a local variable `left_str_num` and assign it to the characters in
`str_num` from index 0 to -(n+1). initialize a variable `right_str_num` and assign
it to the characters in `str_num` from index -n to -1
- concatenate `left_str_num` and the result of invoking
the `rotate_str` method and passing in the value referenced by `right_str_num`
as an argument. convert the result of all of this to an integer, and return that integer
----------------------------------------------------------
=end

# using the `rotate_str` method
# def rotate_rightmost_digits(num, count)
#   str_num = num.to_s
#   left_str_num, right_str_num = str_num[0..-(count+1)], str_num[-count..-1]
#   (left_str_num + rotate_str(right_str_num)).to_i
# end

# using the `rotate_array` method
def rotate_rightmost_digits(num, count)
  str_digits = num.to_s.chars
  left_digits, right_digits = str_digits[0..-(count+1)], str_digits[-count..-1]
  (left_digits + rotate_array(right_digits)).join.to_i
end

# p rotate_rightmost_digits(735291, 1) == 735291
# p rotate_rightmost_digits(735291, 2) == 735219
# p rotate_rightmost_digits(735291, 3) == 735912
# p rotate_rightmost_digits(735291, 4) == 732915
# p rotate_rightmost_digits(735291, 5) == 752913
# p rotate_rightmost_digits(735291, 6) == 352917
#---------------PART 3-------------------------------
# If you take a number like 735291, and rotate it to the left, you get 352917. If
# you now keep the first digit fixed in place, and rotate the remaining digits, you
# get 329175. Keep the first 2 digits fixed in place and rotate again to 321759.
# Keep the first 3 digits fixed in place and rotate again to get 321597. Finally,
# keep the first 4 digits fixed in place and rotate the final 2 digits to get 321579.
# The resulting number is called the maximum rotation of the original number.

# Write a method that takes an integer as argument, and returns the maximum rotation
# of that argument. You can (and probably should) use the rotate_rightmost_digits
# method from the previous exercise.

# Note that you do not have to handle multiple 0s.

=begin
Problem
Inputs:
- an integer
Outputs:
- the maximum rotation of that integer (formatted as an integer)
Explicit Rules:
Implicit Rules:
Questions?:
----------------------------------------------------------
Examples
max_rotation(735291) == 321579
max_rotation(3) == 3
max_rotation(35) == 53
max_rotation(105) == 15 # the leading zero gets dropped
max_rotation(8_703_529_146) == 7_321_609_845
----------------------------------------------------------
Data Structure
----------------------------------------------------------
Scratch Pad
----------------------------------------------------------
Algorithm
- initialize a variable `counter` and assign it to the number of digits in the input
number (counter = number.digits.size)
- initialize a variable `rotated_num` and assign it to the value of the input number
- initialize a loop
  - assign `rotated_num` to the value returned by invoking the `rotate_rightmost_digits`
  method and passing in `rotated_num` and `counter` as arguments
  - decrement `counter` by 1
  - break if counter is less than or equal to 1
- return the value referenced by `rotated_num`
----------------------------------------------------------
=end

# def max_rotation(number)
#   counter = number.digits.size
#   rotated_num = number
#   loop do
#     rotated_num = rotate_rightmost_digits(rotated_num, counter)
#     counter -= 1
#     break if counter <= 1
#   end
#   rotated_num
# end

#------------FURTHER EXPLORATION-----------------------
# Assume you do not have the rotate_rightmost_digits or rotate_array methods.
# How would you approach this problem? Would your solution look different? Does
# this 3 part approach make the problem easier to understand or harder?

# There is an edge case in our problem when the number passed in as the argument has
# multiple consecutive zeros. Can you create a solution that preserves zeros?

def max_rotation(number)
  str_digits = number.to_s.chars
  counter = str_digits.size

  loop do
    str_digits[-counter..-1] = (str_digits[-counter..-1][1..-1] + [str_digits[-counter..-1][0]])
    counter -= 1
    break if counter <= 1
  end

  str_digits.join.to_i
end

p max_rotation(735291) == 321579
p max_rotation(3) == 3
p max_rotation(35) == 53
p max_rotation(105) == 15 # the leading zero gets dropped
p max_rotation(8_703_529_146) == 7_321_609_845
p max_rotation(10005)
p max_rotation(1000005)
