def shout_out_to(name)
    name.upcase!
    # name = name.upcase # alternate method
    # name = name.chars.each { |c| c.upcase! }.join # alternate method

  puts 'HEY ' + name
end

shout_out_to('you') # expected: 'HEY YOU'