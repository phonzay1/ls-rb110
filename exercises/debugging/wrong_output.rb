arr = ["9", "8", "7", "10", "11"]
sorted_arr = arr.sort do |x, y|
               y.to_i <=> x.to_i
             end
p sorted_arr

p arr.sort { |x, y| y.to_i <=> x.to_i }

=begin
Josh wants to print an array of numeric strings in reverse numerical order.
However, the output is wrong. Without removing any code, help Josh get the expected output.
----------
The issue here is that `arr.sort` is binding more "tightly" to the `p` method call
than the `do..end` block is binding to the `sort` method call. Thus, the actual
output is what we would expect if the elements in the array referenced by `arr`
were sorted in standard ascending order as strings. `{..}` blocks bind more tightly than
`do..end` blocks.
-----------
arr = ["9", "8", "7", "10", "11"]
p arr.sort do |x, y|
    y.to_i <=> x.to_i
  end

# Expected output: ["11", "10", "9", "8", "7"]
# Actual output: ["10", "11", "7", "8", "9"]
=end

