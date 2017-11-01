class Investor

  def profit_real
    summ_by_percents = []
    summ_by_payouts  = []

    Borrower.find_each do |borrower|
      summ_by_percents.push(borrower.payout_percents)
      summ_by_payouts.push(borrower.payout_summ)
    end

    result = summ_by_percents.sum / summ_by_payouts.sum
    result = result / Borrower::TERM * Borrower::MONTHES
    result = result * 100

    # profits = []
    # Borrower.find_each do |borrower|
    #   profits.push borrower.payout_profit
    # end
    # profits.sum / Borrower.count
  end

  def profit_virt
    rates = []
    Borrower.find_each do |borrower|
      rates.push borrower.norm_rate
    end
    rates.sum / Borrower.count
  end

end
