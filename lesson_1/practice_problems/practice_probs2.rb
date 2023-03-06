# Given the array below, turn this array into a hash where the names are the keys
# and the values are the positions in the array.

# flintstones = ["Fred", "Barney", "Wilma", "Betty", "Pebbles", "BamBam"]
# ---
# hash_version =  flintstones.each_with_object({}) do |name, hash|
#                   hash[name] = flintstones.index(name)
#                 end
# ---
# hash_version = {}
# index = 0

# loop do
#   break if index == flintstones.size
#   hash_version[flintstones[index]] = index
#   index += 1
# end
#---
# p hash_version
# -----------------------------------
# Add up all of the ages from the Munster family hash:

# ages = { "Herman" => 32, "Lily" => 30, "Grandpa" => 5843, "Eddie" => 10, "Marilyn" => 22, "Spot" => 237 }
#---
# p ages.values.reduce(:+)
#---
# sum = 0
# index = 0

# loop do
#   break if index == ages.values.size
#   sum += ages.values[index]
#   index += 1
# end
# ---
# p sum
# -------------------------------
# In the ages hash, remove people with age 100 and greater.

# ages = { "Herman" => 32, "Lily" => 30, "Grandpa" => 402, "Eddie" => 10 }
# # ---
# # ages.delete_if { |_, age| age >= 100 }
# # ---
# index = 0

# loop do
#   break if index == ages.values.size
#   ages.delete(ages.keys[index]) if ages.values[index] >= 100
#   index += 1
# end
# ---
# p ages
# -----------------------------------
# Pick out the minimum age from our current Munster family hash:

# ages = { "Herman" => 32, "Lily" => 30, "Grandpa" => 5843, "Eddie" => 10, "Marilyn" => 22, "Spot" => 237 }
# # ---
# p ages.values.min
# # ---
# index = 0
# min_age = ages.values[index]

# loop do
#   break if index == ages.values.size
#   min_age = ages.values[index] if ages.values[index] < min_age
#   index += 1
# end

# p min_age
# -----------------------------------
# In the array, find the index of the first name that starts with "Be"

# flintstones = %w(Fred Barney Wilma Betty BamBam Pebbles)

# p flintstones.index { |name| name.start_with?('Be') }
# --------------------------------------
# Write code that changes the array below so that all of the names are shortened
# to just the first three characters. Do not create a new array.

# flintstones = %w(Fred Barney Wilma Betty BamBam Pebbles)

# flintstones.map! { |name| name[0, 3] }

# p flintstones
# -------------------------------------------
# What happens when we modify an array while we are iterating over it? What would
# be output by this code?

# numbers = [1, 2, 3, 4]
# numbers.each do |number|
#   p number
#   numbers.shift(1)
# end

# This code will output the numbers 1 and 3, each on separate lines. 1 is output by
# the first iteration of the block, with `each` passing the `numbers` array element
# at index 0 to the block. Then 1 (numbers[0]) is destructively removed from `numbers`
# by the `shift` method call. `each` moves on to pass the `numbers` array element at index 1
# to the block, which is now the integer 3. 3 is output, then 2 (numbers[0]) is destructively
# removed from `numbers` by the `shift` method call. `each` is now set to move on
# to the `numbers` array element at index 2, but at this point enough elements have
# been removed from `numbers` that there is no element at numbers[2], so `each` stops iterating.
# ---
# What would be output by this code?

# numbers = [1, 2, 3, 4]
# numbers.each do |number|
#   p number
#   numbers.pop(1)
# end

# This code will output the integers 1 and 2 on separate lines. The `each` method call
# will first pass the object returned by numbers[0] to the block, outputting 1. The
# `pop` method call inside the block will then remove the last element in the `numbers`
# array, the integer 4. `each` will then pass the object returned by numbers[1] to the
# block, outputting 2. The number 3 is then removed from `numbers` by `pop`, so
# there is no object at numbers[2] for `each` to iterate over, and it can stop
# iterating.
# ----------------------------------------------------
# As we have seen previously we can use some built-in string methods to change the
# case of a string. A notably missing method is something provided in Rails, but
# not in Ruby itself...titleize. This method in Ruby on Rails creates a string that
# has each word capitalized as it would be in a title.
# Write your own version of the rails titleize implementation.

# title = "the flintstones rock"

# def titleize(str)
#   words = str.split
#   index = 0

#   loop do
#     break if index == words.size
#     words[index][0] = words[index][0].upcase
#     index +=1
#   end

#   words.join(' ')
# end

# p titleize(title)
# ----------------------------------------------
# Given the munsters hash below, modify the hash such that each member of the
# Munster family has an additional "age_group" key that has one of three values
# describing the age group the family member is in (kid, adult, or senior).
# Note: a kid is in the age range 0 - 17, an adult is in the range 18 - 64 and a senior is aged 65+.

munsters = {
  "Herman" => { "age" => 32, "gender" => "male" },
  "Lily" => { "age" => 30, "gender" => "female" },
  "Grandpa" => { "age" => 402, "gender" => "male" },
  "Eddie" => { "age" => 10, "gender" => "male" },
  "Marilyn" => { "age" => 23, "gender" => "female"}
}

# munsters.each do |name, demographics|
#   if (0..17).include?(demographics['age'])
#     demographics['age_group'] = 'kid'
#   elsif (18..64).include?(demographics['age'])
#     demographics['age_group'] = 'adult'
#   elsif (65..).include?(demographics['age'])
#     demographics['age_group'] = 'senior'
#   end
# end

munsters.each do |name, demographics|
  age = demographics['age']
  case
  when (0..17).include?(age)
    demographics['age_group'] = 'kid'
  when (18..64).include?(age)
    demographics['age_group'] = 'adult'
  when (65..).include?(age)
    demographics['age_group'] = 'senior'
  end
end

p munsters