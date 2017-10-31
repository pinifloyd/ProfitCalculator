class Borrowers::PeriodsController < ApplicationController

  before_action :find_borrower, only: %i(new create)
  before_action :check_periods, only: %i(new create)

  def new
    @period = @borrower.periods.build
    @period = Borrower::PeriodDecorator.decorate(@period)
  end

  def create
    @period = @borrower.periods.build

    if @period.send(event_params[:event])
      redirect_to borrower_url(@borrower)
    else
      render action: :new
    end
  end

  private

  def find_borrower
    @borrower = Borrower.find(params[:borrower_id])
    @borrower = BorrowerDecorator.decorate(@borrower)
  end

  def check_periods
    unless @borrower.can_add_new_period?
      return redirect_to borrower_url(@borrower)
    end
  end

  def event_params
    params.require(:period).permit :event
  end

end
