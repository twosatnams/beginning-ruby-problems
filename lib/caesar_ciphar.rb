# Write a function that takes a message and an increment amount and outputs the
# same letters shifted by that amount in the alphabet.

def caesar_ciphar(string, k)
  result = ''
  string.each_char do |char|
  # Character is capital
    if char.ord <= 'Z'.ord && char.ord >= 'A'.ord
      encrypt = char.ord + (k % 26)
      if encrypt > 'Z'.ord
        result += ('A'.ord + (encrypt - 'Z'.ord) - 1).chr
      else
        result += encrypt.chr
      end
    # Character is small
    elsif char.ord <= 'z'.ord && char.ord >= 'a'.ord
      encrypt = char.ord + (k % 26)
      if encrypt > 'z'.ord
        result += ('a'.ord + (encrypt - 'z'.ord) - 1).chr
      else
        result += encrypt.chr
      end
    else
      result += char
    end
  end
  return result
end

puts caesar_ciphar('middle-Outz', 2) == 'okffng-Qwvb'
