# Write a method that takes an integer argument, and returns an Array of all integers,
# in sequence, between 1 and the argument.

# You may assume that the argument will always be a valid integer that is greater than 0.

def sequence(integer)
  (1..integer).to_a
end
#---ANOTHER WAY-----
# def sequence(integer)
#   arr = []
#   1.upto(integer) {|int| arr << int}
#   arr
# end

# p sequence(5) #== [1, 2, 3, 4, 5]
# p sequence(3) #== [1, 2, 3]
# p sequence(1) #== [1]
# p sequence(-1)
# p sequence(0)
# p sequence(-50)

#----------FURTHER EXPLORATION-------------------
# Food for thought: what do you think sequence should return if the argument is not
# greater than 0. For instance, what should you do if the argument is -1? Can you
# alter your method to handle this case?

# Currently `sequence` returns an empty array if the argument is < 0, which I think
# is a reasonable return value in this case. However, we could also output an error
# message asking the user for different input.

def sequence(integer)
  integer > 0 ? (1..integer).to_a : (puts "Please enter an integer > 0")
end

p sequence(5) #== [1, 2, 3, 4, 5]
p sequence(3) #== [1, 2, 3]
p sequence(1) #== [1]
p sequence(-1)
p sequence(0)
p sequence(-50)
