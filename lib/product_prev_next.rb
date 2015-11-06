# Given an array of integers, update every element with multiplication of
# previous and next elements with following exceptions.
# a) First element is replaced by multiplication of first and second.
# b) Last element is replaced by multiplication of last and second last.
# c) No additional space is available

def product_prev_next(array)
  previous = array.first
  array[0] = array[1]*array[2]
  (1..array.length - 2).to_a.each do |idx|
    current = array[idx]
    array[idx] = previous*array[idx + 1]
    previous = current
  end
  array[array.length - 1] = array[array.length - 1]*previous
  return array
end

puts product_prev_next([2, 3, 4, 5, 6]) == [12, 8, 15, 24, 30]
