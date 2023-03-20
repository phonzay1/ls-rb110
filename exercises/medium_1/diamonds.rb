# Write a method that displays a 4-pointed diamond in an n x n grid, where n is an
# odd integer that is supplied as an argument to the method. You may assume that the
# argument will always be an odd integer.

=begin
Problem
Inputs:
- an odd integer (n)
Outputs:
- using *'s, *print* a 4-pointed diamond in an n x n grid
Explicit Rules:
Implicit Rules:
Questions?:
----------------------------------------------------------
Examples
----------------------------------------------------------
Data Structure
- strings
----------------------------------------------------------
Scratch Pad
- the number of spaces on each side of the * in the first row is == n/2
(using integer division), then it steps down by 1 until it reaches 0, then it steps
up by 1 until it reaches n/2 again
- the number of stars per row can be determined by the row number and looking at
a list of the odd numbers between 1 - n (i.e. row 1 has `odds[0]` number of stars,
row 2 has `odds[1]` number of stars, etc)
- Array#reverse_each
----------------------------------------------------------
Algorithm
- initialize a variable `top_spaces` and assign it to n/2
- initialize a variable `bottom_spaces` and assign it to 1
- initialize an array `odds` that contains the odd numbers from 1 - n
- iterate over `odds`:
  - for each number, print `top_spaces` number of spaces, the current array element
  number of *'s, then `top_spaces` number of spaces again
  - decrement `top_spaces` by 1
- iterate over `odds` in reverse order, with indices:
  - go to the next element if the array element == n
  - for each number, print `bottom_spaces` number of spaces, the current array element
  number of *'s, then `bottom_spaces` number of spaces again
  - increment `bottom_spaces` by 1
----------------------------------------------------------
=end

# def diamond(n)
#   top_spaces = n/2
#   bottom_spaces = 1
#   odds = (1..n).to_a.select { |num| num.odd? }

#   odds.each do |num|
#     puts "#{' ' * top_spaces}#{'*' * num}#{' ' * top_spaces}"
#     top_spaces -= 1
#   end

#   odds.reverse_each do |num|
#     next if num == n
#     puts "#{' ' * bottom_spaces}#{'*' * num}#{' ' * bottom_spaces}"
#     bottom_spaces += 1
#   end
# end

# diamond(1)
# diamond(3)
# diamond(5)
# diamond(11)
# diamond(15)

#----------FURTHER EXPLORATION----------------
# Try modifying your solution or our solution so it prints only the outline of the diamond:

def hollow_diamond(n)
  top_spaces = n/2
  bottom_spaces = 1
  odds = (1..n).to_a.select { |num| num.odd? }

  odds.each_with_index do |num, idx|
    if idx == 0
      puts "#{' ' * top_spaces}*#{' ' * top_spaces}"
    else
      puts "#{' ' * top_spaces}*#{' ' * (num-2)}*#{' ' * top_spaces}"
    end
    top_spaces -= 1
  end

  odds.reverse_each do |num|
    next if num == n
    if bottom_spaces == n/2
      puts "#{' ' * bottom_spaces}*#{' ' * bottom_spaces}"
    else
      puts "#{' ' * bottom_spaces}*#{' ' * (num-2)}*#{' ' * bottom_spaces}"
    end
    bottom_spaces += 1
  end
end

hollow_diamond(5)
hollow_diamond(7)
hollow_diamond(11)