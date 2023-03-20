# You have a bank of switches before you, numbered from 1 to n. Each switch is
# connected to exactly one light that is initially off. You walk down the row of
# switches and toggle every one of them. You go back to the beginning, and on this
# second pass, you toggle switches 2, 4, 6, and so on. On the third pass, you go
# back again to the beginning and toggle switches 3, 6, 9, and so on. You repeat
# this process and keep going until you have been through n repetitions.

# Write a method that takes one argument, the total number of switches, and returns
# an Array that identifies which lights are on after n repetitions.

=begin
Problem
Inputs:
- a number, n, representing a number of light switches
Outputs:
- an array of numbers identifying which light switches are on after n repetitions
of the pattern
Explicit Rules:
Implicit Rules:
Questions?:
----------------------------------------------------------
Examples
- if n == 5, the output array should be: [1, 4]
- if n == 10, the output array should be: [1, 4, 9]
----------------------------------------------------------
Data Structure
- hash where the keys are the numbers, and the values are booleans
----------------------------------------------------------
Scratch Pad
- true = light on, false = light off
- after iterating, select the key/value pairs where the value == true, and then
return an array of the associated keys
----------------------------------------------------------
Algorithm
- initialize a hash `switches` where the keys are integers from 1 to n, and the
values are all `false`
- iterate through the integers from 1 to n (1.upto(n))
  - for each iteration, iterate through each key/value pair in `switches`
    - if the key is a multiple of the current integer, switch the boolean value
    of the key's value
- select all key/value pairs in `switches` where the value is == `true`, and return
the keys for those values in an array
----------------------------------------------------------
=end

def lights_on(n)
  switches = {}
  1.upto(n) { |int| switches[int] = false }

  1.upto(n) do |int|
    switches.each do |switch, value|
      switches[switch] = !value if switch % int == 0
    end
  end

  switches.select {|switch, value| value == true}.keys
end

#--------------FURTHER EXPLORATION-----------------------
# Do you notice the pattern in our answer? Every light that is on is a perfect square.
# Why is that?

# What are some alternatives for solving this exercise? What if we used an Array to
# represent our 1000 lights instead of a Hash, how would that change our code?

# We could have a method that replicates the output from the description of this
# problem (i.e. "lights 2, 3, and 5 are now off; 1 and 4 are on.") How would we go
# about writing that code?

def lights_on(n)
  switches = Array.new(n) { |index| [index+1, false]}

  1.upto(n) do |int|
    switches.each do |sub_arr|
      sub_arr[1] = !sub_arr[1] if sub_arr[0] % int == 0
    end
  end

  switches.select {|position, status| status == true}.each_with_object([]) do |(position, status), arr|
    arr << position
  end
end

p lights_on(5)
p lights_on(10)
p lights_on(1000) == [1, 4, 9, 16, 25, 36, 49, 64, 81, 100, 121, 144, 169, 196,
                      225, 256, 289, 324, 361, 400, 441, 484, 529, 576, 625, 676,
                      729, 784, 841, 900, 961]
