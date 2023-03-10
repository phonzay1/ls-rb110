# What will the following code print, and why? Don't run the code until you have tried to answer.

# array1 = %w(Moe Larry Curly Shemp Harpo Chico Groucho Zeppo)
# array2 = []
# array1.each { |value| array2 << value }
# array1.each { |value| value.upcase! if value.start_with?('C', 'S') }
# puts array1.object_id
# puts array2.object_id
# puts array1[0].object_id
# puts array2[0].object_id
# puts array1[3].object_id
# puts array2[3].object_id
# puts array2

# array1 = %w(Moe Larry Curly Shemp Harpo Chico Groucho Zeppo)
# array2 = array1.map { |value| value }
# array1.each { |value| value.upcase! if value.start_with?('C', 'S') }
# puts array1.object_id
# puts array2.object_id
# puts array1[0].object_id
# puts array2[0].object_id
# puts array1[3].object_id
# puts array2[3].object_id
# puts array2

array1 = %w(Moe Larry Curly Shemp Harpo Chico Groucho Zeppo)
array2 = []
array1.each { |value| array2 << value.dup }
array1.each { |value| value.upcase! if value.start_with?('C', 'S') }
puts array1.object_id
puts array2.object_id
puts array1[0].object_id
puts array2[0].object_id
puts array1[3].object_id
puts array2[3].object_id
puts array2
