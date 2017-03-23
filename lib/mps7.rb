Dir.glob('./lib/mps7/*.rb', &method(:require))

module Mps7
  class Process
    def initialize(file)
      @file   = file
      @output = []
    end
    def execute
      data   = read_file
      header = Header.new(ReadHeader.new(data[0..8]).from_binary)
      Mps7.logger.debug "Header -- #{header.to_h}"
      if header.valid?
        starting = 9
        header.count.times do |index|
          Mps7.logger.debug "Processing record #{index+1} of #{header.count}"
          # TODO: chop data off the file everytime its processed?
          starting = content(data: data, starting: starting)
          Mps7.logger.debug "Next record will begin at #{starting}"
        end
      else
        Mps7.logger.fatal header.errors.full_messages.join(", ")
      end
      @output
    end

    private

    def read_file
      Mps7.logger.debug "Begin processing -- #{@file}"
      File.binread(@file)
      # TODO: file not found?
    end

    def content(data:, starting:)
      ending = DetermineChunkEnd.new(
        data: data,
        starting: starting
      ).calculate
      @output << ProcessRecord.new(data: data, starting: starting, ending: ending).retrieve
      ending + 1
    end
  end
end
