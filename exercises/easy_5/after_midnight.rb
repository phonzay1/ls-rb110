# The time of day can be represented as the number of minutes before or after midnight.
# If the number of minutes is positive, the time is after midnight. If the number of
# minutes is negative, the time is before midnight.

# Write a method that takes a time using this minute-based format and returns the
# time of day in 24 hour format (hh:mm). Your method should work with any integer input.

# You may not use ruby's Date and Time classes. Disregard Daylight Savings and
# Standard Time and other complications.

=begin
Problem
Inputs:
- a negative or positive integer, or 0
Outputs:
- a string representing the time of day represented by the input integer in 24 hr format
(hh:mm) in relation to midnight (00:00)
Explicit Rules:
- if the input integer is positive, it represents the number of minutes after midnight
- if the input integer is negative, it represents the number of minutes before midnight
Implicit Rules:
- single digit hour or minute values should be preceded by a '0' (ex. an input
of 3 should return "00:03")
Questions?:
----------------------------------------------------------
Examples
time_of_day(0) == "00:00"
time_of_day(-3) == "23:57"
time_of_day(35) == "00:35"
time_of_day(-1437) == "00:03"
time_of_day(3000) == "02:00"
time_of_day(800) == "13:20"
time_of_day(-4231) == "01:29"
----------------------------------------------------------
Data Structure
----------------------------------------------------------
Scratch Pad
- use Integer#divmod, with 60 as divisor:
  - for 0 or positive integers, the quotient represents the hour in "hr:min" (if <24),
  and the modulus represents the min
    - if the quotient >= 24, then call quotient%24 and the resulting modulus
    represents the hr in "hr:min"
  - for negative integers, convert them to positive. Then 60 - modulus is the min
  in "hr:min", and if the quotient < 24 then 23 - quotient represents the hour in "hr:min"
    - if quotient >= 24, then call quotient%24 and 23 - modulus represents
    the hour

----------------------------------------------------------
Algorithm
- Initialize a string `time` that contains a colon ':'
- Determine if the integer is 0 or positive. If so, determine the quotient and modulus
for the integer when divided by 60
  - Append the modulus (preceded by a 0 if it's a single digit) to the `time` string
  - If the quotient is < 24, prepend the quotient (preceded by a 0 if it's a single
  digit) to the `time` string.
  - If the quotient is >= 24, determine the modulus when when dividing the quotient by 24,
  and prepend that (preceded by a 0 if it's a single digit) to the `time` string.
- If the input integer is negative:
  - Determine the quotient and modulus for the positive equivalent of the integer
  - Append (60 - modulus) in string form, preceded by a 0 if it's a single digit, to the
  `time` string
  - if quotient < 24 then prepend the string representation of (23 - quotient),
  prepended by a 0 if it's a single digit, to the `time` string
  - If the quotient is >=24, determine the modulus when dividing the quotient by 24
  and prepend the string form of (23 - modulus) to the `time` string
- Return the `time` string
----------------------------------------------------------
=end

def time_of_day(minutes)
  time = ':'

  case minutes <=> 0
  when +1, 0
    quotient, modulus = minutes.divmod(60)
    time << (sprintf '%02d', modulus)
    if quotient < 24
      time.prepend(sprintf '%02d', quotient)
    else
      time.prepend(sprintf '%02d', (quotient % 24))
    end
  when -1
    quotient, modulus = (-minutes).divmod(60)
    time << (sprintf '%02d', (60 - modulus))
    if quotient < 24
      time.prepend(sprintf '%02d', (23 - quotient))
    else
      time.prepend(sprintf '%02d', (23 - (quotient % 24)))
    end
  end

  time
end


p time_of_day(0) == "00:00"
p time_of_day(-3) == "23:57"
p time_of_day(35) == "00:35"
p time_of_day(3) == "00:03"
p time_of_day(-1437) == "00:03"
p time_of_day(3000) == "02:00"
p time_of_day(800) == "13:20"
p time_of_day(-4231) == "01:29"