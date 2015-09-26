def fib_recursively(n)
  if n == 0
    []
  elsif n == 1
    [1]
  elsif n == 2
    [1, 1]
  else
    temp = fib_recursively(n - 1)
    temp << temp[-1] + temp[-2]
  end
end

def fib_iteratively(n)
  if n == 0
    return []
  elsif n == 1
    return [1]
  end

  array = [1, 1]

  (n-2).times do |i|
    array << array[-1] + array[-2]
  end

  array
end
