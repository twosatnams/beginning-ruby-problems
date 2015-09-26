def make_change(target, coins)
  # Don't need any coins to make 0 cents change
  return [] if target == 0
  # Can't make change if all the coins are too big.
  return nil if coins.none? { |coin| coin <= target }
  coins = coins.sort.reverse

  best_change = nil
  coins.each_with_index do |coin, index|
    next if coin > target
    remainder = target - coin
    best_remainder = make_change(remainder, coins.drop(index))
    next if best_remainder.nil?
    this_change = [coin] + best_remainder

    if (best_change.nil? || (this_change.count < best_change.count))
      best_change = this_change
    end
  end

  best_change
end

puts make_change(14, [10, 7, 1]) == [7, 7]
