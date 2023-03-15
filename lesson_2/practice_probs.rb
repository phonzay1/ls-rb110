#-----PROBLEM 1-------------------------
# How would you order this array of number strings by descending numeric value?
# arr = ['10', '11', '9', '7', '8']

# p arr.sort { |a, b| b.to_i <=> a.to_i }

#------PROBLEM 2------------------------
# How would you order this array of hashes based on the year of publication of each
# book, from the earliest to the latest?
# books = [
#   {title: 'One Hundred Years of Solitude', author: 'Gabriel Garcia Marquez', published: '1967'},
#   {title: 'The Great Gatsby', author: 'F. Scott Fitzgerald', published: '1925'},
#   {title: 'War and Peace', author: 'Leo Tolstoy', published: '1869'},
#   {title: 'Ulysses', author: 'James Joyce', published: '1922'}
# ]

# p books.sort_by { |hsh| hsh[:published].to_i }

#-----PROBLEM 3-------------------
# For each of these collection objects demonstrate how you would reference the letter 'g'.

# arr1 = ['a', 'b', ['c', ['d', 'e', 'f', 'g']]]
# p arr1[2][1][3]

# arr2 = [{first: ['a', 'b', 'c'], second: ['d', 'e', 'f']}, {third: ['g', 'h', 'i']}]
# p arr2[1][:third][0]

# arr3 = [['abc'], ['def'], {third: ['ghi']}]
# p arr3[2][:third][0][0]

# hsh1 = {'a' => ['d', 'e'], 'b' => ['f', 'g'], 'c' => ['h', 'i']}
# p hsh1['b'][1]

# hsh2 = {first: {'d' => 3}, second: {'e' => 2, 'f' => 1}, third: {'g' => 0}}
# p hsh2[:third].key(0)

#--------PROBLEM 4----------------
# For each of these collection objects where the value 3 occurs, demonstrate how you
# would change this to 4.

# arr1 = [1, [2, 3], 4]
# p arr1
# arr1[1][1] = 4
# p arr1

# arr2 = [{a: 1}, {b: 2, c: [7, 6, 5], d: 4}, 3]
# p arr2
# arr2[2] = 4
# p arr2

# hsh1 = {first: [1, 2, [3]]}
# p hsh1
# hsh1[:first][2][0] = 4
# p hsh1

# hsh2 = {['a'] => {a: ['1', :two, 3], b: 4}, 'b' => 5}
# p hsh2
# hsh2[['a']][:a][2] = 4
# p hsh2

#------------PROBLEM 5--------------------------------
# Consider this nested Hash: determine the total age of just the male members of the family.

# munsters = {
#   "Herman" => { "age" => 32, "gender" => "male" },
#   "Lily" => { "age" => 30, "gender" => "female" },
#   "Grandpa" => { "age" => 402, "gender" => "male" },
#   "Eddie" => { "age" => 10, "gender" => "male" },
#   "Marilyn" => { "age" => 23, "gender" => "female"}
# }

# total_age_males = 0

# munsters.each do |name, demographics|
#   total_age_males += demographics['age'] if demographics['gender'] == 'male'
# end

# p total_age_males

#----------PROBLEM 6---------------------
# One of the most frequently used real-world string properties is that of "string
# substitution", where we take a hard-coded string and modify it with various parameters
# from our program.

# Given this previously seen family hash, print out the name, age and gender of each
# family member like this:

# (Name) is a (age)-year-old (male or female).

# munsters = {
#   "Herman" => { "age" => 32, "gender" => "male" },
#   "Lily" => { "age" => 30, "gender" => "female" },
#   "Grandpa" => { "age" => 402, "gender" => "male" },
#   "Eddie" => { "age" => 10, "gender" => "male" },
#   "Marilyn" => { "age" => 23, "gender" => "female"}
# }

# munsters.each do |name, demographics|
#   puts "#{name} is a #{demographics['age']}-year-old #{demographics['gender']}"
# end

#---------PROBLEM 7-----------------
# Given this code, what would be the final values of a and b? Try to work this out
# without running the code.

# a = 2
# b = [5, 8]
# arr = [a, b]
# p arr[1].object_id
# p b.object_id
# puts "after assignment"

# arr[0] += 2
# arr[1][0] -= a
# p arr[1].object_id
# p b.object_id

# The final value of `a` will be 2, and `b` will be [3, 8]. On line
# 108 when `arr` is assigned to `[a, b]`, initially `a` and `arr[0]` are pointing to
# the same object, and `b` and `arr[1]` are pointing to the same object. However then
# on line 110, arr[0] is reassigned to 4. arr[0] is now pointing to a different object
# than `a`, which still points to the original object: 2. (Note that this does mutate
# `arr`, which is now [4, [5, 8]] - with regards to `arr`, this is indexed assignment/
# array element update, which is mutating).

# On line 111, arr[1][0] is reassigned to the return value of arr[1][0] - a, which
# is 3. This counts as indexed assignment/array element update for both `b` and `arr`
# (`b` and `arr[1]` reference the same object, so when that object is mutated it
# affects the value referenced by both variables), thus `b` is now [3, 8], and `arr` is now [4, [3, 8]].
#---------------PROBLEM 8------------------------------------
# Using the each method, write some code to output all of the vowels from the strings.

# hsh = {first: ['the', 'quick'], second: ['brown', 'fox'], third: ['jumped'], fourth: ['over', 'the', 'lazy', 'dog']}

# hsh.values.flatten.each do |word|
#   word.each_char { |char| puts char if /[aeiou]/.match(char) }
# end
#---------------PROBLEM 9-------------------------------------
# Given this data structure, return a new array of the same structure but with the
# sub arrays being ordered (alphabetically or numerically as appropriate) in descending order.

# arr = [['b', 'c', 'a'], [2, 1, 3], ['blue', 'black', 'green']]

# sorted_arr = arr.map do |sub_arr|
#               sub_arr.sort { |a, b| b <=> a }
#             end

# p sorted_arr
#---------------PROBLEM 10--------------------------------
# Given the following data structure and without modifying the original array, use
# the map method to return a new array identical in structure to the original but
# where the value of each integer is incremented by 1.

# arr = [{a: 1}, {b: 2, c: 3}, {d: 4, e: 5, f: 6}]

# arr2 = arr.map { |hsh| hsh.dup }
# arr2 = arr2.map do |hsh|
#   hsh.each {|letter, num| hsh[letter] += 1}
# end

# p arr2
# p arr
# This approach leaves `arr` unmodified.If we attempt to run lines 157-159 on arr,
# without duplicating each array element on line 156, #map creates a shallow copy of the
# original array, so that each hash array element in the original array is actually
# mutated by the indexed assignment within the #map method call
#------------PROBLEM 11------------------------------------
# Given the following data structure use a combination of methods, including either
# the select or reject method, to return a new array identical in structure to the
# original but containing only the integers that are multiples of 3.

# arr = [[2], [3, 5, 7, 12], [9], [11, 13, 15]]

# arr.map do |sub_arr|
#   sub_arr.select { |num| num % 3 == 0 }
# end
#----------PROBLEM 12--------------------------------------
# Given the following data structure, and without using the Array#to_h method, write
# some code that will return a hash where the key is the first item in each sub array
# and the value is the second item.

# arr = [[:a, 1], ['b', 'two'], ['sea', {c: 3}], [{a: 1, b: 2, c: 3, d: 4}, 'D']]

# arr.each_with_object({}) do |sub_arr, hsh|
#   hsh[sub_arr[0]] = sub_arr[1]
# end
#----------PROBLEM 13-------------------------------
# Given the following data structure, return a new array containing the same sub-arrays
# as the original but ordered logically by only taking into consideration the odd numbers they contain.

# arr = [[1, 6, 9], [6, 1, 7], [1, 8, 3], [1, 5, 9]]

# arr.sort_by do |sub_arr|
#   sub_arr.select { |num| num.odd? }
# end
#---------PROBLEM 14-------------------------------
# Given this data structure write some code to return an array containing the colors
# of the fruits, and the sizes of the vegetables. The sizes should be uppercase and
# the colors should be capitalized.

# hsh = {
#   'grape' => {type: 'fruit', colors: ['red', 'green'], size: 'small'},
#   'carrot' => {type: 'vegetable', colors: ['orange'], size: 'medium'},
#   'apple' => {type: 'fruit', colors: ['red', 'green'], size: 'medium'},
#   'apricot' => {type: 'fruit', colors: ['orange'], size: 'medium'},
#   'marrow' => {type: 'vegetable', colors: ['green'], size: 'large'},
# }

# hsh.each_with_object([]) do |(produce, info), array|
#   array << info[:colors].map {|color| color.capitalize} if info[:type] == 'fruit'
#   array << info[:size].upcase if info[:type] == 'vegetable'
# end
#-------PROBLEM 15-------------------------------------
# Given this data structure write some code to return an array which contains only
# the hashes where all the integers are even.

# arr = [{a: [1, 2, 3]}, {b: [2, 4, 6], c: [3, 6], d: [4]}, {e: [8], f: [6, 10]}]

# arr.select do |hsh|
#   hsh.values.flatten.all? { |num| num.even? }
# end
#-------PROBLEM 16------------------------------------

# Each UUID consists of 32 hexadecimal characters, and is typically broken into 5
# sections like this 8-4-4-4-12 and represented as a string.

# It looks like this: "f65c57f6-a6aa-17a8-faa1-a67f2dc9fa91"

# Write a method that returns one UUID when called with no parameters.

HEXADECIMAL_CHARS = %w(0 1 2 3 4 5 6 7 8 9 a b c d e f)

def make_uuid
  uuid = [8, 4, 4, 4, 12]
  uuid.map! do |section|
    str = ''
    section.times do |_|
      str << HEXADECIMAL_CHARS.sample
    end
    str
  end
  uuid.join('-')
end

p make_uuid
p make_uuid
p make_uuid

