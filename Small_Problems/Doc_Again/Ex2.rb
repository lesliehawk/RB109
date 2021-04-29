# Optional Arguments Redux

# Assume you have the following code:

require 'date'

puts Date.civil
puts Date.civil(2016)
puts Date.civil(2016, 5)
puts Date.civil(2016, 5, 13)

# What will each of the 4 puts statements print?

# Creates a date objecgt denoting the given calendar date

# According to ruby-docs:
#The calendar date is a particular day of a calendar year,
# identified by its ordinal number
# within a calendar month within that year.
# In those classes, this is so-called “civil”.

-4712-01-01 # Years since the Julian Period we are in began.
            # Calendar keeping standard used by astonomers and programmers.
2016-01-01  # 2016 (month and day defaults 1)
2016-05-01  # 2016, May (day defaults 1)
2016-05-13  # 2016, May, 13