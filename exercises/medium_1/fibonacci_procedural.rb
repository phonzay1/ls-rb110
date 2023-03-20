# Rewrite your recursive fibonacci method so that it computes its results without recursion.

def fibonacci(n)
  sum = 1
  num1 = 0
  num2 = 1

  (n-1).times do |_|
    sum = num1 + num2
    num1 = num2
    num2 = sum
  end

  sum
end

# p fibonacci(1) == 1
# p fibonacci(2) == 1
# p fibonacci(3) == 2
# p fibonacci(4) == 3
# p fibonacci(5) == 5
# p fibonacci(12) == 144
# p fibonacci(20) == 6765
# p fibonacci(100) == 354224848179261915075
# p fibonacci(100_001) # => 4202692702.....8285979669707537501
#--------------FIBONACCI LAST DIGIT EXERCISE----------------------
# In this exercise, you are going to compute a method that returns the last digit
# of the nth Fibonacci number.

# def fibonacci_last(n)
#   fibonacci(n).digits[0]
# end

def fibonacci_last(n)
  fibonacci(n).to_s.chars.pop.to_i
end

# p fibonacci_last(15)        # -> 0  (the 15th Fibonacci number is 610)
# p fibonacci_last(20)        # -> 5 (the 20th Fibonacci number is 6765)
# p fibonacci_last(100)       # -> 5 (the 100th Fibonacci number is 354224848179261915075)
# p fibonacci_last(100_001)   # -> 1 (this is a 20899 digit number)
# p fibonacci_last(1_000_007) # -> 3 (this is a 208989 digit number)
p fibonacci_last(123456789) # -> 4