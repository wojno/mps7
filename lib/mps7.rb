require 'mps7/header'
require 'mps7/read_header'
require 'mps7/determine_chunk_end'
require 'mps7/process_record'
require 'mps7/logger'

module Mps7
  # Process transaction binary
  class Process

    def initialize(filename)
      @file     = File.new(filename)
      @filename = filename
      @output   = []
    end

    def execute
      begin
        read_and_process
      ensure
        @file.close
      end
      @output
    end

    private

    def read_and_process
      count = retrieve_record_count
      count.times do |index|
        Mps7.logger.debug "Processing record #{index+1} of #{count}"
        @output << parse_record
      end
    end

    def retrieve_record_count
      data   = @file.read(9)
      header = Header.new(ReadHeader.new(data).from_binary)
      Mps7.logger.debug "Header -- #{header.to_h}"
      if header.valid?
        return header.count
      else
        Mps7.logger.fatal header.errors.full_messages.join(", ")
        return 0
      end
    end

    def parse_record
      type_byte = @file.read(1)
      length    = @file.read(DetermineChunkEnd.new(type_byte).calculate)
      ProcessRecord.new("#{type_byte}#{length}").retrieve
    end
  end
end
