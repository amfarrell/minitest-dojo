require 'minitest/autorun'

class Concordance
  def ask(text)
    1
  end
end

class ConcordanceTest < Minitest::Test
  def test_ask_returns_an_answer
    concordance = Concordance.new
    assert concordance.ask("Whatever") != nil
  end

  def test_counts_hash_for_a_single_word
    concordance = Concordance.new
    assert_equal {"Whatever" => 1}, concordance.ask("Whatever")
  end
end