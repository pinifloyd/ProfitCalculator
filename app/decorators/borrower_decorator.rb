class BorrowerDecorator < Draper::Decorator

  delegate_all

  def start_at
    I18n.l object.start_at, format: "%d.%m.%Y" if object.start_at.present?
  end

  %i(norm_rate over_rate).each do |method|
    define_method method do
      h.number_to_percentage object.send(method), precision: 1
    end
  end

  %i(summ payout_by_percents payout_total_credit).each do |method|
    define_method method do
      h.number_to_currency object.send(method), precision: 2
    end
  end

  %i(payout_by_debt payout_total_month).each do |method|
    define_method method do
      h.number_to_currency object.send(method), precision: 4
    end
  end

end
