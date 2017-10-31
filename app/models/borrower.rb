# == Schema Information
#
# Table name: borrowers
#
#  id         :integer          not null, primary key
#  name       :string
#  summ       :decimal(12, 2)   default(0.0)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Borrower < ApplicationRecord

  MONTHES   = 12
  TERM      = 6
  PERIOD    = 1
  NORM_RATE = 30.0
  OVER_RATE = 50.0

  validates :name, length: { minimum: 3 }, uniqueness: true
  validates :summ, numericality: { greater_than: 0 }

  #
  # Backward Compatibility
  #----------------------------------------------------------------------------
  def term
    TERM
  end

  def period
    PERIOD
  end

  def norm_rate
    NORM_RATE
  end

  def over_rate
    OVER_RATE
  end

  #
  # Calculation methods
  #----------------------------------------------------------------------------
  def payout_by_debt
    summ / term
  end

  def payout_by_percents
    (summ * norm_rate) / MONTHES / 100
  end

  def payout_total_month
    payout_by_debt + payout_by_percents
  end

  def payout_total_credit
    payout_total_month * term
  end

end
