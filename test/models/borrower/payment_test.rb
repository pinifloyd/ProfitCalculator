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

require 'test_helper'

class Borrower::PaymentTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
