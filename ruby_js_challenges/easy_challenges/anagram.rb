class Anagram

  attr_reader :word, :word_arr_sorted

  def initialize(word)
    @word = uncapitalize(word)
    @word_arr_sorted = word.chars.sort
  end

  def match(arr_poss_matches)
    matching_strings = []

    arr_poss_matches.each do | poss_match_word |
      poss_match_word = uncapitalize(poss_match_word)
      next if word == poss_match_word
      poss_match_arr_sorted = poss_match_word.chars.sort
      matching_strings << poss_match_word if poss_match_arr_sorted == word_arr_sorted
    end

    matching_strings
  end

  private

  def uncapitalize(str)
    str[0, 1].downcase + str[1..-1]
  end

end

# class Anagram
#   attr_reader :word

#   def initialize(word)
#     @word = word.downcase
#   end

#   def match(word_array)
#     word_array.select do |ana|
#       ana.downcase != word && anagram?(ana, word)
#     end
#   end

#   private

#   def sorted_letters(str)
#     str.downcase.chars.sort.join
#   end

#   def anagram?(word1, word2)
#     sorted_letters(word1) == sorted_letters(word2)
#   end
# end

# myAnagram = Anagram.new('Medley')

# p myAnagram.match(%w(edmley jos yeldem))

