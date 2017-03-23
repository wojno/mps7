Dir.glob('./lib/mps7/*.rb', &method(:require))

module Mps7
  # Process transaction binary
  class Process
    def initialize(filename)
      @file     = File.new(filename)
      @filename = filename
      @output   = []
    end
    def execute
      data   = read_file(9)
      header = Header.new(ReadHeader.new(data).from_binary)
      Mps7.logger.debug "Header -- #{header.to_h}"
      if header.valid?
        header.count.times do |index|
          Mps7.logger.debug "Processing record #{index+1} of #{header.count}"
          @output << parse_record
        end
      else
        Mps7.logger.fatal header.errors.full_messages.join(", ")
      end
      @output
    end

    private

    def read_file(bytes)
      @file.read(bytes)
    end

    def parse_record
      type_byte = read_file(1)
      length    = read_file(DetermineChunkEnd.new(type_byte).calculate)
      ProcessRecord.new("#{type_byte}#{length}").retrieve
    end
  end
end
