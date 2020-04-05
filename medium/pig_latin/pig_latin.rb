=begin

Add 'ay' to the end
  - begins with vowels
  - begins with x/y follewed by a non-vowel

Add 'ay' to the end, move all starting letters to the back until a vowel is exposed
  - special exception to 'qu'

=end

class PigLatin
  def self.translate(words)
    words.split(/\s/).map do |word|
      if vowel_sound?(word)
        word + "ay"
      else
        transform_consonant_word(word)
      end
    end.join(' ')
  end

  def self.vowel_sound?(word)
    return true if word[0] =~ /[aeiou]/i
    return true if word[0] =~ /[xy]/i && word[1] =~ /[^aeiouxy]/i
  end

  def self.transform_consonant_word(word)
    number_of_starting_consonants = 0
    word.chars.each_with_index do |char, idx|
      if char =~ /u/i && word[idx - 1] =~ /q/i
        number_of_starting_consonants += 1
        break
      end
      break if char =~ /[aeiou]/i
      number_of_starting_consonants += 1
    end

    moved_words = word.slice!(0, number_of_starting_consonants)
    word + moved_words + 'ay'
  end
end
