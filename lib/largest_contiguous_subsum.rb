# Given an array of integers (positive and negative) find the
# largest contiguous subsum (sum of a subarray).

# Try to solve it in O(n) time with O(1) memory.

def largest_contiguous_subsum(array)
  max_sum = 0
  current_sum = 0
  array.each do |num|
    current_sum += num
    max_sum = current_sum if current_sum >= max_sum
    current_sum = 0 if current_sum < 0
  end

  return max_sum
end

puts largest_contiguous_subsum([5, 3, -7, 6]) == 8
puts largest_contiguous_subsum([-4, 2, 8, -1]) == 10
puts largest_contiguous_subsum([2, 9, -3, 12, 3, -7]) == 23
