# == Schema Information
#
# Table name: borrower_payments
#
#  id          :integer          not null, primary key
#  borrower_id :integer
#  summ        :decimal(12, 2)   default(0.0)
#  payed_at    :date
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class Borrower::Payment < ApplicationRecord

  belongs_to :borrower, class_name: 'Borrower'

  validates :summ, numericality: { greater_than_or_equal_to: 0 }

  # Need more time to investigate, but we can use custom validation I guess
  # validates :payed_at, format: { with: /\d{2}.\d{2}.\d{4}/ }
  validates :payed_at, presence: true

  validate :payments_cannot_be_greater_than_term

  private

  def payments_cannot_be_greater_than_term
    if borrower.payments.count >= borrower.term
      errors.add(:payments_count, "Can not be greater then #{borrower.term}")
    end
  end

end
