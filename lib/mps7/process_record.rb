require 'mps7/record'

# Process 13 / 21 byte transactional record
class ProcessRecord
  def initialize(data)
    @data = data
  end

  # each record contains:
  # 1 byte record type enum
  # 4 byte uint32 Unix timestamp
  # 8 byte uint64 user ID
  # 8 byte float64 amount - conditionally
  def retrieve
    create
  end
  
  private

  def create
    record = Record.new(retrieve_from_file)
    if record.valid?
      Mps7.logger.debug "Record created -- #{record.to_h}"
    else
      Mps7.logger.error "Record Invalid -- #{record.to_h}"
      return nil
    end
    record.to_h
  end

  def retrieve_from_file
    Mps7.logger.debug "Record Length -- #{@data.length}"
    @data.unpack('cNQ>G')
  end

end
