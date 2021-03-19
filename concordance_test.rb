require 'minitest/autorun'

class Concordance
  def ask(line)
    words = Hash.new
    line.each_with_index do |word, i|
      if words.include?(word)
        words[word].push(i+1)
      else
        words[word] = [i+1]
      end
    end
    words
  end
end

class ConcordanceTest < Minitest::Test
  def test_counts_hash_for_a_single_word
    concordance = Concordance.new
    assert_equal({"Whatever" => [1]}, concordance.ask(["Whatever"]))
  end

  def test_lists_all_the_lines_for_a_single_word
    concordance = Concordance.new
    lines = ["Whatever", "Whatever"]
    assert_equal({"Whatever" => [1, 2]}, concordance.ask(lines))
  end
end

# The source of the kata is the idea of a Concordance, a listing of all the words that appear
# in a book together with the line numbers that they appear on.
# More on concordances and their history can be found on Wikipedia here
#
# As an example, a concordance of the following text:
#
#
# Now is the winter of our discontent,
# made glorious summer by a son of York.
# Would yield the concordance:
#
# now: 1
# is: 1
# the: 1
# winter: 1
# of: 1,2
# our: 1
# discontent: 1
# made: 2
# glorious: 2
# summer: 2
# by: 2
# a: 2
# son: 2
# york: 2
# The idea is to actually produce a concordance of the Magna Carta text
# (translation provided into modern English by the British Library).
# You can find out more about the London Code Dojo at our homepage.