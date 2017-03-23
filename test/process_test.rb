require 'test_helper'

class ProcessTest < Minitest::Test
  def setup
    @filename = "../txnlog.dat"
  end

  def test_it_can_process_the_provided_file
    output = Mps7::Process.new(@filename).execute
    assert_equal(71, output.size)

    # What is the total amount in dollars of debits?
    assert_equal(
      -18203.69953340208,
      output.select{|d|d['type_id'] == 0}.map{|x| x['amount']}.reduce(:+)
    )
    # What is the total amount in dollars of credits?
    assert_equal(
      9366.019984181883,
      output.select{|d|d['type_id'] == 1}.map{|x| x['amount']}.reduce(:+)
    )
    # How many autopays were started?
    assert_equal(10, output.select{|d|d['type_id'] == 2}.count)
    # How many autopays were ended?
    assert_equal(8, output.select{|d|d['type_id'] == 3}.count)
    # What is balance of user ID 2456938384156277127?
    assert_equal(
      0,
      output.select{|d| d['user_id'] == 2456938384156277127 }.
             map{|x| x['amount']}.reduce(:+)
    )
  end
  def test_it_errors_on_invalid_files
    output = Mps7::Process.new('./test/files/invalid_header.dat').execute
    assert_equal(0, output.size)
  end
end
