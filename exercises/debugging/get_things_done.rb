require 'pry'

def move(n, from_array, to_array)
  return if n <= 0
  to_array << from_array.shift
  # binding.pry
  move(n - 1, from_array, to_array)
end

# Example

todo = ['study', 'walk the dog', 'coffee with Tom']
done = ['apply sunscreen', 'go to the beach']

var = move(2, todo, done)

p todo # should be: ['coffee with Tom']
p done # should be: ['apply sunscreen', 'go to the beach', 'study', 'walk the dog']
p var

to_do = ['bake bread']
it_is_done = ['cook pasta']
move(5, to_do, it_is_done)

p to_do
p it_is_done

=begin
We wrote a method for moving a given number of elements from one array to another.
We decide to test it on our todo list, but invoking move on line 11 results in a
SystemStackError. What does this error mean and why does it happen?
-------------------------------
This error happens because the `move` method is written recursively (it invokes itself),
but there's no end point defined in it, so it continues calling itself indefinitely
until there are too many items on the stack (therefore the error message "stack
level too deep"). The local variable `n` is not reassigned anywhere, so each time
the method is invoked recursively, it continues to pass in `n-1` as an argument.

=end