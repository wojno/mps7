require 'test_helper'

class ProcessTest < Minitest::Test
  def setup
    @file = "../txnlog.dat"
  end

  def test_it_can_process_the_provided_file
    output = Mps7::Process.new(@file).execute
    assert_equal(71, output.size)
  end
  def test_it_errors_on_invalid_files
    output = Mps7::Process.new('./test/files/invalid_header.dat').execute
    assert_equal(0, output.size)
  end
end
