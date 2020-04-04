class OddWords
  def initialize(input_text)
    raise ArgumentError unless valid_input?(input_text)
    @input_text = input_text
  end

  def valid_input?(text)
    return false if text.nil?
    return false if text =~ /[^a-z .]/i 
    return false unless text =~ /[a-z]/i
    return false unless text[-1] == '.'
    return false if text.count('.') > 1
    true
  end

  # text treated as a string
  # def reverse_odd_words
  #   input_chars = @input_text.split(/[^a-z]+/i)
  #   input_chars.map.with_index do |word, idx|
  #     word.reverse! if idx.odd?
  #     if idx == input_chars.size - 1
  #       "#{word}."
  #     else
  #       "#{word} "
  #     end
  #   end.join
  # end

  def reverse_odd_words # text treated as chars
    input_chars = @input_text.chars
    return_string = ''
    reverse = false
    reversed_word = ''
    input_chars.each_with_index do |char,idx|
      if (letter?(char) && reverse == false)
        return_string << char
        if input_chars[idx + 1] == ' '
          return_string << " "
          reverse = true
        end
      elsif letter?(char) && reverse == true
        reversed_word.prepend(char)
        if input_chars[idx + 1] == ' '
          return_string << "#{reversed_word} "
          reversed_word = ''
          reverse = false
        elsif input_chars[idx + 1] == '.'
          return_string << reversed_word
        end
      elsif char == ' '
        next
      elsif char == '.'
        remove_preceding_spaces(return_string)
        return_string << char
      end
    end
    return_string
  end

  def letter?(char)
    char.match?(/[a-z]/i)
  end

  def remove_preceding_spaces(string)
    loop do
      break if letter?(string[-1])
      string.chop!
    end
  end
end
