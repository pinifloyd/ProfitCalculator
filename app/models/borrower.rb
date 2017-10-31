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
#  start_at   :date             default(Tue, 31 Oct 2017), not null
#

class Borrower < ApplicationRecord

  MONTHES = 12.freeze
  PERIOD  = 1.freeze

  has_many :payments, class_name: 'Borrower::Payment', dependent: :destroy

  validates :name, length: { minimum: 3 }, uniqueness: true
  validates :summ, :norm_rate, :over_rate, :term, numericality: { greater_than: 0 }

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

  def periods
    today = Date.current

    monthes_before_today = (today.year * 12 + today.month)
    monthes_before_start = (start_at.year * 12 + start_at.month)

    count = monthes_before_today - monthes_before_start

    (0..count).map { |number| start_at + number.month }
  end

end
