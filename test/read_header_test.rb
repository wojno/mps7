require 'test_helper'

class ReadHeaderTest < Minitest::Test
  def setup
    @rh = ReadHeader.new("MPS7\x01\x00\x00\x00G\x00S")
  end

  def test_unpacks_header_data_properly_and_returns_array
    assert_equal(['MPS7', 1, 71], @rh.from_binary)
  end
  def test_always_returns_array_even_when_input_is_invalid
    rh = ReadHeader.new("foobaz")
    assert_equal(['foob', 97, nil], rh.from_binary)
    rh = ReadHeader.new('')
    assert_equal(['', nil, nil], rh.from_binary)
  end
end
