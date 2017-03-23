# Reads 9 bytes of binary header data according to MPS7 transaction log spec
class ReadHeader
  def initialize(data)
    @data = data
  end

  def from_binary
    unpack
  end

  private

  # unpack header data according to spec
  # 4 byte magic string "MPS7" 
  # 1 byte version 
  # 4 byte (uint32) # of records
  def unpack
    @data.unpack('A4cN') 
  end
end
