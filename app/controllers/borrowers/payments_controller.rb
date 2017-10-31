class Borrowers::PaymentsController < ApplicationController

  before_action :find_borrower

  def new
    @payment = @borrower.payments.build
  end

  def create
    @payment = @borrower.payments.build payment_params

    if @payment.save
      redirect_to borrower_url(@borrower)
    else
      render action: :new
    end
  end

  private

  def find_borrower
    @borrower = Borrower.find(params[:borrower_id])
  end

  def payment_params
    params.require(:payment).permit :summ, :payed_at
  end

end
