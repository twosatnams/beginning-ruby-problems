def merge_sort(array)
  return array if array.length < 2

  idx = array.length / 2
  arr1, arr2 = array[0...idx], array[idx...array.length]

  merge(merge_sort(arr1), merge_sort(arr2))
end

def merge(arr1, arr2)
  i, j = 0, 0
  result = []

  while i < arr1.length && j < arr2.length
    if arr1[i] < arr2[j]
      result << arr1[i]
      i += 1
    else
      result << arr2[j]
      j += 1
    end
  end

  if i < arr1.length
    result += arr1[i..arr1.length]
  elsif j < arr2.length
    result += arr2[j..arr1.length]
  end
end
