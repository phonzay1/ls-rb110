# counter = 10

# 10.times do
#   puts counter
#   counter -= 1
# end

# puts 'LAUNCH!'

#----FURTHER EXPLORATION----------
# We specify 10 two times, which looks a bit redundant. It should be possible to
# specify it only once. Can you refactor the code accordingly?

10.downto(1) { |counter| puts counter }

puts 'LAUNCH!'