require 'test_helper'

class DetermineChunkEndTest < Minitest::Test
  def setup
    @data = "MPS7\u0001\u0000\u0000\u0000G\u0000SU\xF0 \u000E$\x8BQN\u0016\u0000\xE7@\x84\xE5bgSe6\u0002R\xE1\xF4\xBB3\xAF\xD3yAC\x90\x89"
  end
  def test_handles_basic_transaction_record_for_auto_pay
    assert_equal(42, DetermineChunkEnd.new(data: @data, starting: 30).calculate)
  end
  def test_handles_amount_data_for_credit_or_debit
    assert_equal(29, DetermineChunkEnd.new(data: @data, starting: 9).calculate)
  end
end
