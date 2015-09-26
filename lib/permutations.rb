# Question - Write a function that returns all permutations of a string
# Help - http://codingtonic.blogspot.in/2015/02/permutations-of-string.html


def permutations(string)
  permutations_helper(string, 0, string.length - 1)
end

def permutations_helper(string, first, last)
  if first == last
    puts string.chomp
  else
    (first..last).each do |i|
      swap(string, first, i)
      permutations_helper(string, first + 1, last)
      swap(string, first, i)
    end
  end
end

def swap(string, first, second)
  temp = string[first]
  string[first] = string[second]
  string[second] = temp
end

puts permutations("ABCD")
