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

  has_many :periods, class_name: 'Borrower::Period', dependent: :destroy

  validates :name, length: { minimum: 3 }, uniqueness: true
  validates :summ, numericality: { greater_than: 0 }

  def can_add_new_period?
    !(periods.count == term || periods.ahead.any?)
  end

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

  def intime_periods
    periods.intime.count
  end

  def overdue_periods
    periods.overdue.count
  end

  def ahead_periods
    periods.ahead.count
  end

  #
  # Calculation methods
  #----------------------------------------------------------------------------
  def payout_by_debt
    summ / term
  end

  def payout_by_percents
    summ * norm_rate / MONTHES / 100
  end

  def payout_by_overdue
    summ * over_rate / MONTHES / 100
  end

  def payout_total_month
    payout_by_debt + payout_by_percents
  end

  def payout_total_month_overdue
    payout_by_debt + payout_by_overdue
  end

  def payout_total_credit
    payout_total_month * term
  end

  def payout_total_debt
    payout_by_debt * intime_periods
  end

  def payout_total_ahead
    summ - payout_total_debt + payout_by_percents
  end

  def payout_percents
    payout_by_percents * (intime_periods + ahead_periods) + payout_by_overdue * overdue_periods
  end

  def payout_summ
    total = (intime_periods + overdue_periods) * payout_by_debt
    total += periods.ahead.first.summ - payout_by_percents if ahead_periods == 1
    total
  end

  def payout_profit
    payout_percents / payout_summ * MONTHES / term * 100
  end

end
