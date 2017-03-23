# Determines length of chunk to read in from the file
# based upon the type of record application is evaluating
class DetermineChunkEnd
  def initialize(data)
    @data = data
  end

  def calculate
    from_record_type
  end

  private

  def from_record_type
    case RetrieveRecordType.new(@data).from_data
    when "debit", "credit"
      20
    when "start_auto_pay", "end_auto_pay"
      12
    end
  end
end
