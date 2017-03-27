require 'mps7/base_object'

# Transactional Record containing:
# record type
# Unix timestamp
# User ID
# Transaction Amount -- optional
class Record < BaseObject

  validates_presence_of :type_id, :timestamp, :user_id

  validates :type_id, inclusion: { in: [0,1,2,3] }
  # valid epoch?
  # valid user_id?
  validates :amount, numericality: true, if: :credit_or_debit?
  validate  :amount_sign#, if: :amount

  def credit_or_debit?
    %w[credit debit].include? RetrieveRecordType.new(type_id).from_data
  end

  # ensure amount is positive / negative depending on record type
  # TODO: perhaps move this into the initialize method
  def amount_sign
    @amount = case RetrieveRecordType.new(type_id).from_data
              when 'debit'
                -@amount
              when 'credit'
                @amount.abs
              end
  end

  attr_reader :type_id, :timestamp, :user_id, :amount

  def initialize(data)
    @type_id     = data[0]
    @timestamp   = data[1]
    @user_id     = data[2].to_i # Ruby 2.4 unifies Fixnum / Bignum into Integer
    @amount      = data[3]
  end
end
