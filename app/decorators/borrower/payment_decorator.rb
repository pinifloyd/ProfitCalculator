class Borrower::PaymentDecorator < Draper::Decorator

  delegate_all

  def summ
    h.number_to_currency object.summ, precision: 2
  end

  def payed_at
    I18n.l object.payed_at, format: "%d.%m.%Y" if object.payed_at.present?
  end

end
