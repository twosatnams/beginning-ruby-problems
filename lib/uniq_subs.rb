# Write a method that finds all the unique substrings for a word.
require 'set'

def uniq_subs(word)
  result = []
  set = Set.new
  (0...word.length).to_a.each do |idx1|
    (idx1...word.length).to_a.each do |idx2|
      sample = word[idx1..idx2]
      if !set.include?(sample)
        result << sample
        set << sample
      end
    end
  end
  return result
end

puts uniq_subs("abccd")
