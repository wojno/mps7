require 'test_helper'

class RetrieveRecordTypeTest < Minitest::Test
  def test_supports_debit_record_lookup
    assert_equal("debit", RetrieveRecordType.new("\x00").from_data)
  end
  def test_supports_credit_record_lookup
    assert_equal("credit", RetrieveRecordType.new("\x01").from_data)
  end
  def test_supports_start_auto_pay_record_lookup
    assert_equal("start_auto_pay", RetrieveRecordType.new("\x02").from_data)
  end
  def test_supports_end_auto_pay_record_lookup
    assert_equal("end_auto_pay", RetrieveRecordType.new("\x03").from_data)
  end
  def test_returns_nil_for_unknown_record_type
    assert_nil RetrieveRecordType.new("\xDEADBEEF").from_data
  end
  def test_supports_integer_record_type_values
    assert_equal("debit", RetrieveRecordType.new(0).from_data)
  end
  def test_supports_string_record_type_values_when_value_is_integer
    # TODO: String Integers are not currently handled
    skip
    assert_equal("debit", RetrieveRecordType.new('0').from_data)
  end
end
