def digital_root(num)
  return num if num < 10
  digital_root(sum_digits(num))
  # digital_root((num % 10) + (num / 10))
end

def sum_digits(num)
  return num if num < 10
  return num % 10 + sum_digits(num / 10)
end

# Tests
puts digital_root(9) == 9
puts digital_root(24) == 6
puts digital_root(78) == 6
puts digital_root(9875) == 2
