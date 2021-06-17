# After Midnight (Part 1)
# The time of day can be represented as the number of minutes before or after midnight.

# If the number of minutes is positive, the time is after midnight.
# If the number of minutes is negative, the time is before midnight.

# Write a method that takes a time using this minute-based format
# and returns the time of day in 24 hour format (hh:mm).
# Your method should work with any integer input.

# You may not use ruby's Date and Time classes.

def time_str(num)
  num > 9 ? "#{num}" : "0#{num}"
end

def time_of_day(mins)
  hours, mins = mins.divmod(1440)
  hours, mins = mins.divmod(60)
  "#{time_str(hours)}:#{time_str(mins)}"
end

# Wow, I am really proud of myself with this one.
# I feel like I'm starting to understand what they mean by "getting it".
# I have enough in my head now that I'm starting to think the language, and it can flow.

# Examples:

p time_of_day(0) == "00:00"
p time_of_day(-3) == "23:57"
p time_of_day(35) == "00:35"
p time_of_day(-1437) == "00:03"
p time_of_day(3000) == "02:00"
p time_of_day(800) == "13:20"
p time_of_day(-4231) == "01:29"

# 10:34am-11:06am (32 mins)