# In a daily share trading, a buyer buys shares in the morning and sells it on
# same day. If the trader is allowed to make at most 2 transactions in a day,
# where as second transaction can only start after first one is complete
# (Sell->buy->sell->buy). Given stock prices throughout day, find out maximum
# profit that a share trader could have made.

def maximum_profit(prices)
  max_profit = 0
  (2..prices.length - 2).to_a.each do |idx|
    first_transaction = max_difference(prices.slice(0, idx))
    second_transaction = max_difference(prices.slice(idx, prices.length))
    profit = first_transaction + second_transaction
    max_profit = profit if profit > max_profit
  end
  max_profit
end

def max_difference(arr)
  min_element = Float::INFINITY
  max_diff = 0
  arr.each do |el|
    min_element = el if el < min_element
    max_diff = el - min_element if el - min_element > max_diff
  end
  max_diff
end

puts maximum_profit([10, 22, 5, 75, 65, 80]) == 87
puts maximum_profit([2, 30, 15, 10, 8, 25, 80]) == 100
puts maximum_profit([100, 30, 15, 10, 8, 25, 80]) == 72
puts maximum_profit([90, 80, 70, 60, 50]) == 0
