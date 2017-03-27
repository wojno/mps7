require 'test_helper'

class HeaderTest < Minitest::Test

  def test_valid_header
    header = Header.new(['MPS7', 1, 42])
    assert header.valid?
  end

  def test_requires_magic_string_of_mps7
    header = Header.new(['foozle', 1, 42])
    refute header.valid?
  end
  def test_requires_known_version
    header = Header.new(['MPS7', 3, 42])
    refute header.valid?
  end
  def test_requires_count_greater_than_zero
    header = Header.new(['MPS7', 1, 0])
    refute header.valid?
  end
end
