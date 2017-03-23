require 'test_helper'

class DetermineChunkEndTest < Minitest::Test
  def test_handles_basic_transaction_record_for_auto_pay
    assert_equal(12, DetermineChunkEnd.new("\x02").calculate)
    assert_equal(12, DetermineChunkEnd.new("\x03").calculate)
  end
  def test_handles_amount_data_for_credit_or_debit
    assert_equal(20, DetermineChunkEnd.new("\x00").calculate)
    assert_equal(20, DetermineChunkEnd.new("\x01").calculate)
  end
end
