# Write a method that returns an Array that contains every other element of an Array
# that is passed in as an argument. The values in the returned list should be those
# values that are in the 1st, 3rd, 5th, and so on elements of the argument Array.

# def oddities(arr)
#   every_other = []
#   arr.each_with_index { |el, index| every_other << el if index.even? }
#   every_other
# end

#--------FURTHER EXPLORATION---------------------
# Write a companion method that returns the 2nd, 4th, 6th, and so on elements of an array.

# def evens(arr)
#   every_other = []
#   arr.each_with_index { |el, index| every_other << el if index.odd? }
#   every_other
# end

# p evens([1, 2, 3, 4, 5, 6])
# p evens([1, 2, 3, 4, 1])

# Try to solve this exercise in at least 2 additional ways.

# def oddities(arr)
#   index = 0
#   arr.each_with_object([]) do |num, every_other_arr|
#     every_other_arr << num if index.even?
#     index += 1
#   end
# end

def oddities(arr)
  index = -1
  arr.select do |_|
    index += 1
    index.even?
  end
end

p oddities([2, 3, 4, 5, 6]) #== [2, 4, 6]
p oddities([1, 2, 3, 4, 5, 6]) #== [1, 3, 5]
p oddities(['abc', 'def']) == ['abc']
p oddities([123]) == [123]
p oddities([]) == []
p oddities([1, 2, 3, 4, 1]) == [1, 3, 1]