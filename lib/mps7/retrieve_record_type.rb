# Determines transaction record type
# 0x00: Debit
# 0x01: Credit
# 0x02: StartAutopay
# 0x03: EndAutopay
class RetrieveRecordType
  def initialize(data)
    @data = data
  end

  def from_data
    unpack_and_lookup
  end

  private

  def unpack
    case @data
    when String
      @data.unpack('c').first
    when Fixnum
      @data
    end
  end

  def unpack_and_lookup
    case unpack
    when 0
      "debit"
    when 1
      "credit"
    when 2
      "start_auto_pay"
    when 3
      "end_auto_pay"
    end
  end
end
