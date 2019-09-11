require_relative 'test_algo.rb'
require "test/unit"

class RankOfSearch < Test::Unit::TestCase

  def test_files
    hsh = {'f1' => 2, 'f2' => 3}
    words_length = 3
    result = rank(hsh, words_length)

    assert_equal(100, result['f2'])
    assert_equal(66, result['f1'])
  end

  def test_with_more_files
    hsh = {'f1' => 2, 'f2' => 3, 'f3' => 1}
    words_length = 3
    result = rank(hsh, words_length)

    assert_equal(33, result['f3'])
    assert_equal(100, result['f2'])
    assert_equal(66, result['f1'])
  end

  def test_files_with_zero_count
    hsh = {'f1' => 0, 'f2' => 0}
    words_length = 4
    result = rank(hsh, words_length)

    assert_equal(0, result['f2'])
    assert_equal(0, result['f1'])
  end  

  def test_with_no_files
    hsh = {}
    words_length = 4
    result = rank(hsh, words_length)

    assert_equal(0, result['f2'])
    assert_equal(0, result['f1'])
  end

  def test_files_with_greater_count_than_words_count
    hsh = {'file1' => 5}
    words_length = 4
    result = rank(hsh, words_length)
    
    assert_equal(100, result['file1'])
  end 

  def test_with_zero_words_count
    hsh = {'file1' => 1}
    words_length = 0

    assert_raise( ZeroDivisionError ) { rank(hsh, words_length) }
  end

  def test_files_with_invalid_count
    hsh = {'file1' => -1}
    words_length = 2

    assert_raise( RuntimeError ) { rank(hsh, words_length) }
  end
    
end  