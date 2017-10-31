# == Schema Information
#
# Table name: borrowers
#
#  id         :integer          not null, primary key
#  name       :string
#  summ       :decimal(12, 2)   default(0.0)
#  norm_rate  :decimal(12, 2)   default(0.0)
#  over_rate  :decimal(12, 2)   default(0.0)
#  term       :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Borrower < ApplicationRecord

  MONTHES = 12.freeze
  PERIOD  = 1.freeze

  # WIP: hardcoded as I have many questions
  def period
    PERIOD
  end

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
