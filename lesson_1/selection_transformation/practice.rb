# In this example we want to select the key-value pairs where the value is 'Fruit'.

# produce = {
#   'apple' => 'Fruit',
#   'carrot' => 'Vegetable',
#   'pear' => 'Fruit',
#   'broccoli' => 'Vegetable'
# }

# def select_fruit(produce_list)
#   produce_list.select do |item, category|
#     category == 'Fruit'
#   end
# end

# p select_fruit(produce) # => {"apple"=>"Fruit", "pear"=>"Fruit"}
# p produce
# -----------------------------------------------
# Can you implement a double_numbers! method that mutates its argument?

# def double_numbers!(numbers)
#   index = 0

#   loop do
#     break if index == numbers.size

#     numbers[index] *= 2

#     index += 1
#   end

#   numbers
# end

# my_numbers = [1, 4, 3, 7, 2, 6]
# p double_numbers!(my_numbers) # => [2, 8, 6, 14, 4, 12]
# p my_numbers
# ----------------------------------------------------------
# Try coding a solution that doubles the numbers that have odd indices:

# def double_if_odd_index(numbers)
#   doubled_numbers = []
#   index = 0

#   loop do
#     break if index == numbers.size

#     current_number = numbers[index]
#     current_number *= 2 if index.odd?
#     doubled_numbers << current_number

#     index += 1
#   end

#   doubled_numbers
# end

# my_numbers = [1, 4, 3, 7, 2, 6]
# p double_if_odd_index(my_numbers)

# p my_numbers

# ------------------------------
# Try coding a method that allows you to multiply every array item by a specified value

# def multiply(arr, multiplier)
#   multiplied_arr = []
#   index = 0

#   loop do
#     break if index == arr.size
#     multiplied_arr << arr[index] * multiplier
#     index += 1
#   end

#   multiplied_arr
# end

# my_numbers = [1, 4, 3, 7, 2, 6]
# puts multiply(my_numbers, 3) == [3, 12, 9, 21, 6, 18]

