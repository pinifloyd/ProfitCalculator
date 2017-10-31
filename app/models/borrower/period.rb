# == Schema Information
#
# Table name: borrower_periods
#
#  id          :integer          not null, primary key
#  borrower_id :integer
#  summ        :decimal(12, 2)   default(0.0)
#  mark        :string
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class Borrower::Period < ApplicationRecord

  include StateMachine::Helpers::State

  attr_accessor :event

  belongs_to :borrower, class_name: 'Borrower'

  scope :intime,  -> { where state: :intime }
  scope :overdue, -> { where state: :overdue }
  scope :ahead,   -> { where state: :ahead }

  state_machine :state, initial: :init do
    state :intime
    state :overdue
    state :ahead

    event :set_intime do
      transition from: :init, to: :intime
    end

    event :set_overdue do
      transition from: :init, to: :overdue
    end

    event :set_ahead do
      transition from: :init, to: :ahead
    end

    before_transition init: :intime do |period, transition|
      period.summ = period.borrower.payout_total_month
    end

    before_transition init: :overdue do |period, transition|
      period.summ = period.borrower.payout_total_month_overdue
    end

    before_transition init: :ahead do |period, transition|
      period.summ = period.borrower.payout_total_ahead
    end
  end

end
