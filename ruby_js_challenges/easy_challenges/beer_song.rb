class BeerSong

  def self.verse(verse_nbr)
    self.one_verse(verse_nbr)
  end

  def self.verses(start_verse_nbr, end_verse_nbr)
    out_str = ''
    start_verse_nbr.downto(end_verse_nbr) do |v|
      out_str << self.one_verse(v)
      out_str << "\n" unless v == end_verse_nbr
    end
    out_str 
  end

  def self.lyrics
    self.verses(99, 0)
  end

  def self.one_verse(verse_nbr)
    if verse_nbr == 2
      "2 bottles of beer on the wall, 2 bottles of beer.\n" \
      "Take one down and pass it around, 1 bottle of beer on the wall.\n" \
    elsif verse_nbr == 1
      "1 bottle of beer on the wall, 1 bottle of beer.\n" \
      "Take it down and pass it around, no more bottles of beer on the wall.\n" \
    elsif verse_nbr == 0
      "No more bottles of beer on the wall, no more bottles of beer.\n" \
      "Go to the store and buy some more, 99 bottles of beer on the wall.\n"
    else
      "#{verse_nbr} bottles of beer on the wall, #{verse_nbr} bottles of beer.\n" \
        "Take one down and pass it around, #{verse_nbr-1} bottles of beer on the wall.\n"
    end
  end
end

# def test_another_verse
#   expected = "3 bottles of beer on the wall, 3 bottles of beer.\n" \
#     "Take one down and pass it around, 2 bottles of beer on the wall.\n"
#   assert_equal expected, BeerSong.verse(3)
# end

# puts BeerSong.verse(13)

# puts BeerSong.verses(13, 11)

# puts BeerSong.lyrics