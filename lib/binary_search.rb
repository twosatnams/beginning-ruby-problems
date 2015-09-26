def binary_search(array, target, start = 0, finish = array.length - 1)
  if start > finish
    return nil
  end

  idx = (start + finish) / 2
  if array[idx] == target
    idx
  elsif target < array[idx]
    binary_search(array, target, start, idx - 1)
  else
    binary_search(array, target, idx + 1, finish)
  end
end
