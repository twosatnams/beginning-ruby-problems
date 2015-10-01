# Write a function that takes a year (four digit integer) and returns an array
# with the 10 closest subsequent years that meet the following condition:
# the first two digits summed with the last two digits are equal to
# the middle two digits. E.g.,

# 1978 => 19 + 78 = 97
# 2307 => 23 + 07 = 30

def silly_years(year)
  result = []
  while result.length < 10
    result << year if silly_year?(year)
    year += 1
  end
  result
end

def silly_year?(year)
  return (year / 10) % 100 == (year / 100) + (year % 100)
end

puts silly_year?(1978) == true
puts silly_year?(2307) == true
puts silly_year?(2002) == false
puts silly_year?(1338) == false

puts silly_years(2015)
