require 'test_helper'

class ProcessRecordTest < Minitest::Test

  def test_returns_a_basic_transaction_when_receiving_13_bytes
    pr = ProcessRecord.new(
      "\u0002R\xE1\xF4\xBB3\xAF\xD3yAC\x90\x89"
    )
    expected = {
      "type_id"   => 2,
      "timestamp" => 1390539963,
      "user_id"   => 3724427934598140041,
      "amount"    => nil
    }
    assert_equal(expected, pr.retrieve)
  end
  def test_returns_a_negative_amount_when_receiving_21_bytes_for_debit
    pr = ProcessRecord.new(
      "\u0000S\t'\xD19gG\xC0Eّ!@\x82\xE21\xD6\xD7.\x8D\u0001T"
    )
    expected = {
      "type_id"   => 0,
      "timestamp" => 1393108945,
      "user_id"   => 4136353673894269217,
      "amount"    => -604.274335557087
    }
    assert_equal(expected, pr.retrieve)
  end
  def test_returns_a_positive_amount_when_receiving_21_bytes_for_credit
    pr = ProcessRecord.new(
      "\u0001S\t'\xD19gG\xC0Eّ!@\x82\xE21\xD6\xD7.\x8D\u0001T"
    )
    expected = {
      "type_id"   => 1,
      "timestamp" => 1393108945,
      "user_id"   => 4136353673894269217,
      "amount"    => 604.274335557087
    }
    assert_equal(expected, pr.retrieve)
  end
  def test_returns_nil_when_retrieved_record_is_invalid
    pr = ProcessRecord.new("MPS7")
    assert_nil pr.retrieve
  end
end
