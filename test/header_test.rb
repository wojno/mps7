require 'test_helper'

class HeaderTest < Minitest::Test
  def setup
    @header = Header.new(['MPS7', 1, 42])
  end

  def test_requires_magic_string_of_mps7
    assert @header.valid?
    @header.magic_string = 'foozle'
    refute @header.valid?
  end
  def test_requires_known_version
    assert @header.valid?
    @header.version = 3
    refute @header.valid?
  end
  def test_requires_count_greater_than_zero
    assert @header.valid?
    @header.count = 0
    refute @header.valid?
  end
end
