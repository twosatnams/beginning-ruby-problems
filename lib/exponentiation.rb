def exp1(number, power)
  return 1 if power == 0
  number * exp1(number, power - 1)
end

def exp2(number, power)

  if power == 0
    return 1
  elsif power == 1
    return number
  end

  if power.even?
    temp = exp2(number, power / 2)
    temp * temp
  else
    temp = exp2(number, (power - 1) / 2)
    number * temp * temp
  end
end
