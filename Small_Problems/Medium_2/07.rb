# Unlucky Days

# Write a method that returns the number of Friday the 13ths
# in the year given by an argument.
# You may assume that the year is greater than 1752
# (when the United Kingdom adopted the modern Gregorian Calendar)
# and that it will remain in use for the foreseeable future.

require 'date'

def friday_13th(year)
  start_date = Date.new(year, 1, 1)
  end_date = Date.new(year, 12, 31)
  (start_date...end_date).select { |date| date.friday? && date.mday == 13 }.count
end

#Further Exploration:

# def five_fridays(year)
#   start_date = Date.new(year, 1, 1)
#   end_date = Date.new(year, 12, 31)
#   fridays = (start_date...end_date).select { |day| day.friday?}
#   months = fridays.map { |friday| friday.mon }
#   count = Hash.new(0)
#   months.each { |month| count[month] += 1 }
#   count.select { |k, v| v >= 5 }.count
# end

# Refactored to after reading other students answers:

def five_fridays(year)
  count = Hash.new(0)
  start_date = Date.new(year, 1, 1)
  end_date = Date.new(year, 12, 31)

  (start_date...end_date).each do |date|
    count[date.mon] += 1 if date.friday?
  end

  count.values.count(5)
end

puts friday_13th(2015) == 3
puts friday_13th(1986) == 1
puts friday_13th(2019) == 2

puts five_fridays(2015)
puts five_fridays(1986)
puts five_fridays(2019)
puts five_fridays(2020)
puts five_fridays(2021)
puts five_fridays(2022)
puts five_fridays(2023)
puts five_fridays(2024)
