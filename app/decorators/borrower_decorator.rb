class BorrowerDecorator < Draper::Decorator

  delegate_all

  %i(norm_rate over_rate payout_profit).each do |method|
    define_method method do
      h.number_to_percentage object.send(method), precision: 1
    end
  end

  %i(summ payout_by_percents payout_total_credit payout_summ).each do |method|
    define_method method do
      h.number_to_currency object.send(method), precision: 2
    end
  end

  %i(payout_by_debt payout_total_month payout_percents).each do |method|
    define_method method do
      h.number_to_currency object.send(method), precision: 4
    end
  end

end
