# You are given a method named spin_me that takes a string as an argument and returns
# a string that contains the same words, but with each word's characters reversed.
# Given the method's implementation, will the returned string be the same object as
# the one passed in as an argument or a different object?

def spin_me(str)
  str.split.each do |word|
    word.reverse!
  end.join(" ")
end

spin_me("hello world") # "olleh dlrow"

# The returned string will be a different object than the original string passed in
# as an argument. On line 7, `split` is called on the string object referenced by
# method parameter `str`. This creates a new array object containing copies of all
# of the words in the string referenced by `str`. All remaining operations inside the
# `spin_me` method definition are performed on this new array object, leaving the
# original string object referenced by `str` unmodified.