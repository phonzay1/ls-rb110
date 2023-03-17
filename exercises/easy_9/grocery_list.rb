# Write a method which takes a grocery list (array) of fruits with quantities and
# converts it into an array of the correct number of each fruit.

def buy_fruit(grocery_list)
  grocery_list.each_with_object([]) do |item_arr, arr|
    item_arr[1].times { arr << item_arr[0] }
  end
end

p buy_fruit([["apples", 3], ["orange", 1], ["bananas", 2]]) ==
   ["apples", "apples", "apples", "orange", "bananas","bananas"]