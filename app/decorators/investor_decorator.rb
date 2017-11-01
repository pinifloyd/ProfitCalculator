class InvestorDecorator < Draper::Decorator

  delegate_all

  %i(profit_real profit_virt).each do |method|
    define_method method do
      h.number_to_percentage object.send(method), precision: 1
    end
  end

end
