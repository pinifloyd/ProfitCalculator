class Borrowers::PaymentsController < ApplicationController

  before_action :find_borrower
  before_action :find_payment, only: %i(edit update destroy)

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

  def edit; end

  def update
    if @payment.update_attributes payment_params
      redirect_to borrower_url(@borrower)
    else
      render action: :edit
    end
  end

  def destroy
    @payment.destroy and redirect_to borrower_url(@borrower)
  end

  private

  def find_borrower
    @borrower = Borrower.find(params[:borrower_id])
  end

  def find_payment
    @payment = @borrower.payments.find(params[:id])
  end

  def payment_params
    params.require(:payment).permit :summ, :payed_at
  end

end
