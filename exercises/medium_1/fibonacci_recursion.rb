# Write a recursive method that computes the nth Fibonacci number, where nth is an
# argument to the method.

=begin
- if n < 2, return n - stop condition
=end

def fibonacci(n)
  n < 2 ? n : fibonacci(n-1) + fibonacci(n-2)
end

p fibonacci(1) == 1
p fibonacci(2) == 1
p fibonacci(3) == 2
p fibonacci(4) == 3
p fibonacci(5) == 5
p fibonacci(12) == 144
p fibonacci(20) == 6765

#-----FURTHER EXPLORATION-----------
# Before you move on, take some time to think about our solution (not the tail
# recursive solution). Can you identify any faults with it? Not bugs, but problems
# that impact its usability. How might you try to repair the issues you identify?
# Don't do any coding right now.

# If someone enters 0 or a negative number as n, it will return that number (in my
# solution) or 1 (in the Launch School solution). The solution currently allows for
# floats as input.