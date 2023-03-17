# Create a method that takes 2 arguments, an array and a hash. The array will contain
# 2 or more elements that, when combined with adjoining spaces, will produce a person's
# name. The hash will contain two keys, :title and :occupation, and the appropriate values.
# Your method should return a greeting that uses the person's full name, and mentions
# the person's title and occupation.

=begin
Problem
Inputs:
- an array with 2 or more elements (parts of a person's full name), and a hash
with two keys (:title and :occupation) and their respective values
Outputs:
- a greeting that includes the person's full name, title, and occupation
Explicit Rules:
Implicit Rules:
Questions?:
- should the greeting just be returned from the method, or actually output(printed)
by the method?
----------------------------------------------------------
Examples
greetings(['John', 'Q', 'Doe'], { title: 'Master', occupation: 'Plumber' })
=> "Hello, John Q Doe! Nice to have a Master Plumber around."
----------------------------------------------------------
Data Structure
----------------------------------------------------------
Scratch Pad
----------------------------------------------------------
Algorithm
----------------------------------------------------------
=end

def greetings(name, info)
  "Howdy, #{name.join(' ')}! I've always wanted to meet a #{info[:title]} "\
  "#{info[:occupation]}."
end

puts greetings(['John', 'Q', 'Doe'], { title: 'Master', occupation: 'Plumber' })
puts greetings(['Harry', 'Potter'], {title: 'Boy Who', occupation: 'Lived'})