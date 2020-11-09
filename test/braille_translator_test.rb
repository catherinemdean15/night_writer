# require './test/test_helper'
require 'minitest/autorun'
require 'minitest/pride'
require './lib/braille_translator'

class BrailleTranslatorTest < Minitest::Test

  def setup
    contents = "0.00\n0..0\n..00"
    @braille_translator = BrailleTranslator.new(contents)
  end

  def test_it_exists
    assert_instance_of BrailleTranslator, @braille_translator
  end

  def test_it_converts_to_rows
    expected = {0 => "0.00", 1 => "0..0", 2 => "..00"}
    assert_equal expected, @braille_translator.convert_to_rows
  end

  def test_it_splits_row_to_letter
    expected = {0 => ["0.","00"], 1 => ["0.",".0"], 2 => ["..","00"]}
    assert_equal expected, @braille_translator.row_to_letter
  end


end