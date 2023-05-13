# To be a valid triangle, the sum of the lengths of the two shortest sides must be
# greater than the length of the longest side, and all sides must have lengths greater
# than 0: if either of these conditions is not satisfied, the triangle is invalid.

# Write a method that takes the lengths of the 3 sides of a triangle as arguments,
# and returns a symbol :equilateral, :isosceles, :scalene, or :invalid depending on
# whether the triangle is equilateral, isosceles, scalene, or invalid.

=begin
Problem
Inputs:
- 3 numbers representing the lengths of each side of a triangle
Outputs:
- a symbol that describes whether the triangle is equilateral (all 3 sides equal),
isosceles (2 sides equal), scalene (all sides unequal), or invalid
Explicit Rules:
Implicit Rules:
Questions?:
----------------------------------------------------------
Examples
triangle(3, 3, 3) == :equilateral
triangle(3, 3, 1.5) == :isosceles
triangle(3, 4, 5) == :scalene
triangle(0, 3, 3) == :invalid
triangle(3, 1, 1) == :invalid
----------------------------------------------------------
Data Structure
- put the input numbers into an array
----------------------------------------------------------
Scratch Pad
----------------------------------------------------------
Algorithm
- initialize an empty array `sides` and add the 3 input numbers to it
- sort `sides` in ascending order
- if sides[0] + sides[1] <= sides[2], or if any element in sides is <= 0, return
:invalid
- if sides[0] == sides[1] == sides[2], return :equilateral
- after checking for equilateral: then check if sides[0] == sides[1] or sides[1] == sides[2].
If so, return :isosceles
- otherwise, return :scalene
----------------------------------------------------------
=end

def triangle(side1, side2, side3)
  sides = [side1, side2, side3].sort
  if sides[0] + sides[1] <= sides[2] || sides.any? { |side| side <= 0 }
    :invalid
  elsif sides[0] == sides[1] && sides[1] == sides[2]
    :equilateral
  elsif sides[0] == sides[1] || sides[1] == sides[2]
    :isosceles
  else
    :scalene
  end
end


p triangle(3, 3, 3) == :equilateral
p triangle(3, 3, 1.5) == :isosceles
p triangle(3, 4, 5) == :scalene
p triangle(0, 3, 3) == :invalid
p triangle(3, 1, 1) == :invalid