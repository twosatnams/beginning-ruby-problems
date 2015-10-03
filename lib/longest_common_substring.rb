# Write a function, common_substrings(str1, str2) that takes two strings and
# returns the longest common substring.

def common_substrings(str1, str2)
  result = ""

  idx1 = 0
  while idx1 < str1.length
    idx2 = idx1
    while idx2 < str1.length
      candidate = str1[idx1..idx2]
      if str2.include?(candidate) && candidate.length >= result.length
        result = candidate
      end
      idx2 += 1
    end
    idx1 += 1
  end

  return result
end

# Tests
puts common_substrings("abcd", "bcd") == "bcd"
puts common_substrings("satnam", "satbtnam") == "tnam"
