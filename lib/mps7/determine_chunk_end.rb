class DetermineChunkEnd
  def initialize(data:, starting:)
    @data     = data
    @starting = starting
  end

  def calculate
    from_record_type
  end

  private

  def from_record_type
    case RetrieveRecordType.new(@data[@starting]).from_data
    when "debit", "credit"
      @starting + 20
    when "start_auto_pay", "end_auto_pay"
      @starting + 12
    end
  end
end
