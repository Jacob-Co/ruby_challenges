=begin

input: one or two numbers of descending value
output: beers on the wall one number then one number minus 1
       if zero get more bottles

1. def a create_verse method that accepts an integer
2. if integer == 0, put get more bottles
3. else return a string with the bottles on the wall

=end

class  BeerSong

  def initialize
    @hsh_verses = {1 => first_verse, 2 => second_verse, 0 => end_verse}
    @hsh_verses.default_proc = proc { |_, key| generic_verse(key)}
  end

  def generic_verse(verse_number)
    "#{verse_number} bottles of beer on the wall, #{verse_number} bottles of beer.\n" \
    "Take one down and pass it around, #{verse_number - 1} bottles of beer on the wall.\n"
  end

  def first_verse
    "1 bottle of beer on the wall, 1 bottle of beer.\n" \
    "Take it down and pass it around, no more bottles of beer on the wall.\n"
  end

  def second_verse
    "2 bottles of beer on the wall, 2 bottles of beer.\n" \
    "Take one down and pass it around, 1 bottle of beer on the wall.\n"
  end

  def end_verse
    "No more bottles of beer on the wall, no more bottles of beer.\n" \
    "Go to the store and buy some more, 99 bottles of beer on the wall.\n"
  end

  def verses(first_verse, last_verse)
    (last_verse..first_verse).to_a.reverse.map{ |verse_number| @hsh_verses[verse_number] }.join("\n")
  end

  def verse(verse_number)
    @hsh_verses[verse_number]
  end

  def lyrics
    verses(99,0)
  end
end
