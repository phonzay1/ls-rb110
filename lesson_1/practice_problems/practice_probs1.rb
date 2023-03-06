# What is the return value of the select method below? Why?

[1, 2, 3].select do |num|
  num > 5
  'hi'
end

# This code will return the array [1, 2, 3], because `select` selects elements from
# a collection based on the truthiness of the value returned from the block when each
# collection element is passed to the block. This block will always return the string 'hi',
# since that's the last evaluated expression in the block. 'hi' evaluates to true,
# so the block returns a truthy value for every collection element, and they're all
# included in the new array that is returned.
# -------------------------------
# How does `count` treat the block's return value? How can we find out?

['ant', 'bat', 'caterpillar'].count do |str|
  str.length < 4
end

# `count` considers whether the value returned from the block for each collection element
# is truthy, and returns an integer: the number of elements for which the
# block evaluates to true.
# ---------------------------------------
# What is the return value of reject in the following code? Why?

[1, 2, 3].reject do |num|
  puts num
end

# `reject` in this code will return a new array: [1, 2, 3]. `reject` considers the
# truthiness of the value returned from the block for each collection element, and
# returns elements for which the block does not evaluate as true, inside of a new array.
# In this case, the block will always return `nil` because of the `puts` method invocation
# that is the last evaluated expression within it. Thus, the block always evaluates
# as falsey, and all collection elements are included in the new, returned array.
# ------------------------------------
# What is the return value of each_with_object in the following code? Why?

['ant', 'bear', 'cat'].each_with_object({}) do |value, hash|
  hash[value[0]] = value
end

# `each_with_object` will return this hash: {'a'=>'ant', 'b'=>'bear', 'c'=>'cat'}.
# An empty hash is passed to `each_with_object` as an argument. Each element of the
# calling array is passed to the block, using the block parameter `value`. The element
# at index 0 of each element of the calling array is added to the empty hash as a key,
# with a value of the value referenced by `value`. Each of the calling array's elements
# are strings, so each key in the resulting hash is the first character of each of
# these strings.
# ------------------------------------
# What does shift do in the following code? How can we find out?

hash = { a: 'ant', b: 'bear' }
hash.shift

# `shift` removes and returns the first key-value pair in a hash as an array, so in 
# this case this array will be returned: [:a, 'ant']. The original hash is mutated,
# so now `hash = {:b=>'bear'}.
# --------------------------
# What is the return value of the following statement? Why?

['ant', 'bear', 'caterpillar'].pop.size

# This code will return the integer 11. The `pop` method is called first, which destructively 
# removes the last element in the calling array, and returns that element, which is
# the string 'caterpillar'. `size` is then called on 'caterpillar', returning the number
# of characters in the string: 11.
# -------------------------------------------
# What is the block's return value in the following code? How is it determined? 
# Also, what is the return value of `any?` in this code and what does it output?

[1, 2, 3].any? do |num|
  puts num
  num.odd?
end

# This block will return a boolean (true or false) for each collection element, based
# on whether the element is an odd integer (returns true) or an even integer (returns false).
# `num.odd?` is the last evaluated expression in the block, so this determines the 
# return value of the block.

# `any?` returns the boolean true in this case. It outputs the number 1, due to the 
# `puts` method invocation on line 74. The other collection elements are not output,
# because once `num.odd?` returns true for the collection element 1, the return value
# of `any` is guaranteed and the other collection elements are not passed to the block 
# and evaluated.
# ----------------------------
# How does `take` work? Is it destructive? How can we find out?

arr = [1, 2, 3, 4, 5]
arr.take(2)

# `take` returns a new array containing the first `n` elements of the calling array,
# where `n` is the argument passed to `take` (`take` requires an argument). It is not
# destructive. So in this code, [1, 2] will be returned, and arr will remain assigned
# to the original unmutated array([1, 2, 3, 4, 5]).
# ------------------------------
# What is the return value of `map` in the following code? Why?

{ a: 'ant', b: 'bear' }.map do |key, value|
  if value.size > 3
    value
  end
end

# `map` returns [nil, 'bear']. `map` returns a new, transformed array based on the
# return values of passing each collection element to the block. For the first key-value
# pair in the calling hash, the `if` branch condition evaluates as false and the branch
# is not executed, therefore the `if` statement (and the block) returns nil. 
# For the second key-value pair, the `if` branch condition evaluates as true and 
# returns the value referenced by `value`: 'bear'.
# -------------------------------
# What is the return value of the following code? Why?

[1, 2, 3].map do |num|
  if num > 1
    puts num
  else
    num
  end
end

# This code returns [1, nil, nil]. `map` returns a new, transformed array based on 
# the values returned by passing each collection element to the block. In this case
# when 1 is passed to the block, the `else` branch of the `if/else` statement is executed,
# returning 1. However when 2 and 3 are passed to the block, the `if` branch is executed.
# Due to the `puts` method invocation within the `if` branch, executing this branch
# returns `nil`.

