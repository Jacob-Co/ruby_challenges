class Anagram
  def initialize(word)
    @main_word = word
  end

  def match(arr_words)
    ret_arr = []
    arr_words.each do |word|
      ret_arr << word if anagram?(word)
    end

    ret_arr.sort
  end

  def anagram?(word)
    candidate = word.chars.map(&:downcase)
    main = @main_word.chars.map(&:downcase)
    return false if candidate == main
    main.sort == candidate.sort
  end
end