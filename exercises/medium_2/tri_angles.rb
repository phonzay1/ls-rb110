# To be a valid triangle, the sum of the angles must be exactly 180 degrees, and
# all angles must be greater than 0: if either of these conditions is not satisfied, the triangle is invalid.

# Write a method that takes the 3 angles of a triangle as arguments, and returns a
# symbol :right, :acute, :obtuse, or :invalid depending on whether the triangle is a right, acute, obtuse, or invalid triangle.

# You may assume integer valued angles so you don't have to worry about floating
# point errors. You may also assume that the arguments are specified in degrees.

=begin
Problem
Inputs:
- 3 integers that represent angles of a triangle
Outputs:
- a symbol indicating what kind of triangle is formed by the input angles: right,
acute, obtuse, or invalid
Explicit Rules:
Implicit Rules:
Questions?:
----------------------------------------------------------
Examples
----------------------------------------------------------
Data Structure
- array
----------------------------------------------------------
Scratch Pad
----------------------------------------------------------
Algorithm
- put the 3 input angles into an array assigned to the variable `angles`
- check the following conditions, in order:
  - if the sum of the elements in `angles` does not equal 180, or any of the
  elements are <= 0, return :invalid
  - if `angles` includes 90, return :right
  - if any element in `angles` is greater than 90, return :obtuse
  - otherwise, return :acute
----------------------------------------------------------
=end

def triangle(angle1, angle2, angle3)
  angles = [angle1, angle2, angle3]

  if angles.sum != 180 || angles.any? { |angle| angle <= 0 }
    :invalid
  elsif angles.include?(90)
    :right
  elsif angles.any? { |angle| angle > 90 }
    :obtuse
  else
    :acute
  end
end

p triangle(60, 70, 50) == :acute
p triangle(30, 90, 60) == :right
p triangle(120, 50, 10) == :obtuse
p triangle(0, 90, 90) == :invalid
p triangle(50, 50, 50) == :invalid