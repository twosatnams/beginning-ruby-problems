# Given an integer array, output all pairs that sum up to a specific value k.
# List the pairs in [min, max] order

# Brute-force solution - n**2 (Iterate the entire array for every element)

require 'set'

def pair_sum(arr, k)
  seen = Set.new
  pairs = Set.new

  arr.each do |num|
    target = k - num

    if seen.include?(target)
      # add in [min, max] order
      pairs.add(
        [[num, target].min, [num, target].max]
      )
    end

    # add `num` after checking; what if we put this before and there's
    # a single `0` is in the `arr`?
    seen.add(num)
  end
  pairs
end

puts pair_sum([2, 4, 1, 7, 4, -1, 9, 5], 6) == [[2, 4], [1, 5], [-1, 7]].to_set
