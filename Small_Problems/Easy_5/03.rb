# After Midnight (Part 2)
# As seen in the previous exercise, the time of day can be represented
# as the number of minutes before or after midnight.

# If the number of minutes is positive, the time is after midnight.
# If the number of minutes is negative, the time is before midnight.

# Write two methods that each take a time of day in 24 hour format,
# and return the number of minutes before and after midnight, respectively.
# Both methods should return a value in the range 0..1439.

# You may not use ruby's Date and Time methods.

def after_midnight(time)
  return 0 if time == "00:00" || time == "24:00"
  hours = time[0, 2].to_i
  minutes = time[3, 2].to_i
  hours * 60 + minutes
end

def before_midnight(time)
  return 0 if time == "00:00" || time == "24:00"
  1440 - after_midnight(time)
end

# Examples:

p after_midnight('00:00') == 0
p before_midnight('00:00') == 0
p after_midnight('12:34') == 754
p before_midnight('12:34') == 686
p after_midnight('24:00') == 0
p before_midnight('24:00') == 0

# (25 min)