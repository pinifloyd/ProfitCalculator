class DashboardController < ApplicationController

  def show
    @investor = InvestorDecorator.decorate(Investor.new)
  end

end
