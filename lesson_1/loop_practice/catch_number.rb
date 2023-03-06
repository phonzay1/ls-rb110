# Modify the following code so that the loop stops if number is equal to or between 0 and 10.

loop do
  number = rand(100)
  break if (0..10).include?(number)
  puts number
end