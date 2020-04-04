require 'minitest/autorun'

require_relative 'odd_words'

class OddWordsTest < Minitest::Test
  def test_reverse_odd_words_happy_path
    test = OddWords.new("whats the matter with kansas.").reverse_odd_words
    assert_equal("whats eht matter htiw kansas.",test)
  end

  def test_reverse_odd_words_edge_cases
    test1 = OddWords.new("o   .").reverse_odd_words
    assert_equal("o.", test1)

    test2 = OddWords.new('What The    egg   whites    il op.').reverse_odd_words
    assert_equal("What ehT egg setihw il po.", test2)
  end

  def test_reverse_odd_words_failure
    assert_raises(ArgumentError) {OddWords.new(nil).reverse_odd_words}
    assert_raises(ArgumentError) {OddWords.new("").reverse_odd_words}
    assert_raises(ArgumentError) {OddWords.new("words words").reverse_odd_words}
    assert_raises(ArgumentError) {OddWords.new("words! words.").reverse_odd_words}
    assert_raises(ArgumentError) {OddWords.new("words! words..").reverse_odd_words}
    assert_raises(ArgumentError) {OddWords.new("words. words.").reverse_odd_words}
  end
end