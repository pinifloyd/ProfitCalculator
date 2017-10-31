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

end
