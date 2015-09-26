require 'set'

class WordChainer

  attr_reader :dictionary, :current_words, :all_seen_words

  def initialize(file_name = 'dictionary.txt')
    @dictionary = File.readlines(file_name).map(&:chomp).to_set
  end

  def adjacent_words(word)
    result = Set.new
    word.length.times do |idx|
      ("a".."z").each do |alphabet|
        word_copy = word.dup
        word_copy[idx] = alphabet
        result << word_copy if @dictionary.include?(word_copy)
      end
    end
    result.delete(word)
  end

  def explore_current_words
    new_current_words = []
    current_words.each do |current_word|
      adjacent_words(current_word).each do |adjacent_word|
        if !all_seen_words.include?(adjacent_word)
          current_words << adjacent_word
          all_seen_words[adjacent_word] = current_word
        end
      end
      @current_words = new_current_words
    end
  end

  def run(source, target)
    @current_words = [source]
    @all_seen_words = { source => nil }
    until current_words.empty
      explore_current_words
      p new_current_words
      break if current_words.include?(target)
    end
  end

end

if __FILE__ == $PROGRAM_NAME
  game = WordChainer.new.run("duck", "ruby")
end
