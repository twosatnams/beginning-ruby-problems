def quicksort(array)
  return array if array.length <= 1

  pivot = array.shift
  left = []
  right = []

  array.each do |el|
    el < pivot ? left << el : right << el
  end

  return quicksort(left).concat([pivot]).concat(quicksort(right))
end

puts quicksort([4,2,5,1,3]) == [1,2,3,4,5]
