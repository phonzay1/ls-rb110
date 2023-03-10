# As seen in the previous exercise, the time of day can be represented as the number
# of minutes before or after midnight. If the number of minutes is positive, the time
# is after midnight. If the number of minutes is negative, the time is before midnight.

# Write two methods that each take a time of day in 24 hour format, and return the
# number of minutes before and after midnight, respectively. Both methods should return
# a value in the range 0..1439.

# You may not use ruby's Date and Time methods.

=begin
Problem
Inputs:
- a string with the time of day in 24-hr format ("hr:min")
Outputs:
- method 1: the number of minutes before midnight indicated by the time
- method 2: the number of minutes after midnight indicated by the time
Explicit Rules:
- the returned number should be between 0-1439 for each method
- both '00:00' and 24:00' are valid time formats
Implicit Rules:
Questions?:
----------------------------------------------------------
Examples
after_midnight('00:00') == 0
before_midnight('00:00') == 0
after_midnight('12:34') == 754
before_midnight('12:34') == 686
after_midnight('24:00') == 0
before_midnight('24:00') == 0
----------------------------------------------------------
Data Structure
----------------------------------------------------------
Scratch Pad
- converting string to integer, removing leading zeroes
----------------------------------------------------------
Algorithm
after_midnight:
- initialize a variable `minutes` to 0, to reference the sum of minutes
- extract the first two characters from the input string
  - if they're '24', return 0 and exit. Otherwise:
  - remove leading zero, if any
  - convert to an integer
  - multiply by 60, and add this result to `minutes` -> **doesn't work for '24:00'**!!
- extract the final two characters from the input string
  - remove leading zero, if any
  - convert to an integer
  - add this result to `minutes`
- return `minutes`

before_midnight:
- initialize a variable `minutes` to 1440, to reference the total minutes
- extract the first two characters from the input string
  - remove leading zero, if any
  - convert to an integer
  - multiply by 60, and subtract this result from 'minutes' -> ** doesn't work for '00:00'**!!
- extract the final two characters from the input string
  - remove leading zero, if any
  - convert to an integer
  - subtract this result from `minutes`
- If `minutes` == 1440, return 0. Otherwise, return `minutes`
----------------------------------------------------------
=end

def after_midnight(time)
  minutes = 0
  hr = time[0, 2]

  if hr == '24'
    minutes
  else
    hr.sub!(/^0/, "")
    minutes += (hr.to_i * 60)

    min = time[-2, 2]
    min.sub!(/^0/, "")
    minutes += min.to_i
  end
end

def before_midnight(time)
  minutes = 1440
  hr = time[0, 2]
  hr.sub!(/^0/, "")
  minutes -= (hr.to_i * 60)

  min = time[-2, 2]
  min.sub!(/^0/, "")
  minutes -= min.to_i

  minutes == 1440 ? 0 : minutes
end


p after_midnight('00:00') == 0
p before_midnight('00:00') == 0
p after_midnight('12:34') == 754
p before_midnight('12:34') == 686
p after_midnight('24:00') == 0
p before_midnight('24:00') == 0