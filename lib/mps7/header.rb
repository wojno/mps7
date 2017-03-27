require 'mps7/base_object'

# Header contains the canoical information about how records are processed
class Header < BaseObject

  validates :magic_string,
    inclusion: { in: %w[MPS7], message: 'Unknown magic string -- %{value}'}
  validates :version,
    numericality: {  equal_to: 1, message: 'Unsupported version -- %{value}'}
  validates :count, numericality: {  greater_than: 0 }

  attr_reader :magic_string, :version, :count

  def initialize(data)
    @magic_string = data[0]
    @version      = data[1]
    @count        = data[2]
  end
end
