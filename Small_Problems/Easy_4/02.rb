# What Century is That?
# Write a method that takes a year as input and returns the century.
# The return value should be a string that begins with the century number,
# and ends with st, nd, rd, or th as appropriate for that number.

# New centuries begin in years that end with 01.
# So, the years 1901-2000 comprise the 20th century.

def century(year)
  year = year.to_s
  if year.to_i < 100
    century = 1
  elsif year[-1] + year[-2] == '00'
    century = year.chop.chop.to_i
  else
    century = year.chop.chop.to_i
    century += 1
  end

  if century.to_s[-2, 2].to_i.between?(11, 13)
    ending = "th"
  elsif century.to_s[-1] == '1'
    ending = 'st'
  elsif century.to_s[-1] == '2'
    ending = 'nd'
  elsif century.to_s[-1] == '3'
    ending = 'rd'
  else
    ending = 'th'
  end

  "#{century}#{ending}"
end

# LS Answer:

def century(year) #2021
  century = year / 100 + 1 #2021 / 100 = 20 + 1 = 21
  #century == 21
  century -= 1 if year % 100 == 0 #21 - 1 if 2021 % 100 == 0 #=>false
  #century == 21
  century.to_s + century_suffix(century)
  #"century" + 'st'
end

def century_suffix(century) #21
  return 'th' if [11, 12, 13].include?(century % 100) #21 % 100 == 21 #false
  last_digit = century % 10

  case last_digit
  when 1 then 'st' #1 #=> 'st'
  when 2 then 'nd'
  when 3 then 'rd'
  else 'th'
  end
end

def century(year) #5
  century = year / 100 + 1 #5 / 100 = 0 + 1 = 1
  #century == 1
  century -= 1 if year % 100 == 0 #5 - 1 if 5 % 100 == 0 #=>false
  #century == 1
  century.to_s + century_suffix(century)
  #"century" + 'st'
end

def century_suffix(century) #21
  return 'th' if [11, 12, 13].include?(century % 100) #1 % 100 == 1 #false
  last_digit = century % 10

  case last_digit
  when 1 then 'st' #1 #=> 'st'
  when 2 then 'nd'
  when 3 then 'rd'
  else 'th'
  end
end

def century(year) #11201
  century = year / 100 + 1 #11201 / 100 = 1112 + 1 = 1113
  #century == 113
  century -= 1 if year % 100 == 0 #1 #=>false
  #century == 113
  century.to_s + century_suffix(century)
  #"113" + 'th'
end

def century_suffix(century) #21
  return 'th' if [11, 12, 13].include?(century % 100) #113 % 100 == 13 #true #=> 'th'
  last_digit = century % 10

  case last_digit
  when 1 then 'st'
  when 2 then 'nd'
  when 3 then 'rd'
  else 'th'
  end
end

# Examples:

p century(2001) == '21st'
p century(1965) == '20th'
p century(256) == '3rd'
p century(5) == '1st'
p century(10103) == '102nd'
p century(1052) == '11th'
p century(1127) == '12th'
p century(11201) == '113th'