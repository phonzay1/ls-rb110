# Write a method that takes a floating point number that represents an angle between
# 0 and 360 degrees and returns a String that represents that angle in degrees, minutes
# and seconds. You should use a degree symbol (°) to represent degrees, a single quote (')
# to represent minutes, and a double quote (") to represent seconds. A degree has 60 minutes,
# while a minute has 60 seconds.

=begin
Problem
Inputs:
- a floating point number representing an angle from 0-360 degrees
Outputs:
- a string representing the input angle in degrees, minutes, and seconds
Explicit Rules:
Implicit Rules:
Questions?:
----------------------------------------------------------
Examples
dms(30) == %(30°00'00")
dms(76.73) == %(76°43'48")
dms(254.6) == %(254°36'00")
dms(93.034773) == %(93°02'05")
dms(0) == %(0°00'00")
dms(360) == %(360°00'00") || dms(360) == %(0°00'00")
----------------------------------------------------------
Data Structure
----------------------------------------------------------
Scratch Pad
- format('%02d', integer)
----------------------------------------------------------
Algorithm
- initialize a variable `angle` and assign it to an empty string
- append the string representation of the whole number portion of the input number
to 'angle'
- append a degree symbol to `angle`
- Assign a variable `minutes` to the result of doing the following: subtract the
whole number portion of the input number from the input number. Multiply the result by 60
  - Append the string representation of the whole number portion of this number to
  `angle` (adding a leading zero if needed)
  - append a single quotation mark to `angle`
- Assign a variable `seconds` to the result of doing the following: subtract the whole
number portion of `minutes` from `minutes`. Multiply the result by 60, and round to
a whole number value.
  - Append the string representation of `minutes` to `angle`, adding a leading zero if
  needed
  - append a double quotation mark to `angle`
- return `angle`
----------------------------------------------------------
=end

# DEGREE = "\xC2\xB0"
# DEGREE_TO_MINS = 60
# DEGREE_TO_SECS = 60

# def dms(number)
#   angle = ''
#   degrees = number.to_i
#   angle.concat(degrees.to_s, DEGREE)

#   minutes = (number - degrees) * DEGREE_TO_MINS
#   angle.concat(format('%02d', minutes.to_i), "'")

#   seconds = ((minutes - minutes.to_i) * 60).round
#   angle.concat(format('%02d', seconds), '"')
# end

# p dms(30) #== %(30°00'00")
# p dms(76.73) #== %(76°43'48")
# p dms(254.6) #== %(254°36'00")
# p dms(93.034773) #== %(93°02'05")
# p dms(0) #== %(0°00'00")
# p dms(360) #== %(360°00'00") || dms(360) == %(0°00'00")

#-----FURTHER EXPLORATION------------------------
# Since degrees are normally restricted to the range 0-360, can you modify the code
# so it returns a value in the appropriate range when the input is less than 0 or greater than 360?

DEGREE = "\xC2\xB0"
MINUTES_PER_DEGREE = 60
SECONDS_PER_MINUTE = 60
SECONDS_PER_DEGREE = MINUTES_PER_DEGREE * SECONDS_PER_MINUTE

def dms(degrees_float)
  if degrees_float > 360
    degrees_float = degrees_float % 360
  elsif degrees_float < 0
    negative_angle = (-degrees_float) % 360
    degrees_float = 360 - negative_angle
  end

  total_seconds = (degrees_float * SECONDS_PER_DEGREE).round
  degrees, remaining_seconds = total_seconds.divmod(SECONDS_PER_DEGREE)
  minutes, seconds = remaining_seconds.divmod(SECONDS_PER_MINUTE)
  format(%(#{degrees}#{DEGREE}%02d'%02d"), minutes, seconds)
end

p dms(400) == %(40°00'00")
p dms(-40) == %(320°00'00")
p dms(-420) == %(300°00'00")