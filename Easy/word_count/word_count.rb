class Phrase
  def initialize(phrase)
    @phrase = phrase
  end

  def split_phrase
    words = @phrase.split(/[^a-z\d']+/i)
    ret_arr = []
    counter = 0
    loop do
      break if counter >= words.size
      if possessive_word?(words[counter])
        ret_arr << "#{words[counter]} #{words[counter + 1]}"
        counter += 2
      else
        characters = words[counter].chars
        characters.delete_at(0) unless characters[0].match(/[a-z\d]/i)
        characters.delete_at(-1) unless characters[-1].match(/[a-z\d]/i)
        ret_arr << characters.join
        counter += 1
      end
    end

    ret_arr
  end

  def word_count
    ret_hash = {}
    split_phrase.each do |word|
      word = word.downcase
      if ret_hash[word] == nil
        ret_hash[word] = 1
      else
        ret_hash[word] += 1
      end
    end
    ret_hash
  end

  def possessive_word?(word)
    return true if (word[-1] == "'" && word[-2] == "s") ||
                   (word[-2] == "'" && word[-1] == "s")
  end
end