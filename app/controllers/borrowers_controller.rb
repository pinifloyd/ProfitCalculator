class BorrowersController < ApplicationController

  before_action :find_borrower, only: %i(show edit update destroy)

  def index
    @borrowers = Borrower.order(id: :desc)
    @borrowers = BorrowerDecorator.decorate_collection(@borrowers)
  end

  def show
    @borrower = BorrowerDecorator.decorate(@borrower)
  end

  def new
    @borrower = Borrower.new
  end

  def create
    @borrower = Borrower.new borrower_params

    if @borrower.save
      redirect_to borrower_url @borrower
    else
      render action: :new
    end
  end

  def edit; end

  def update
    if @borrower.update_attributes borrower_params
      redirect_to borrower_url @borrower
    else
      render action: :edit
    end
  end

  def destroy
    @borrower.destroy and redirect_to borrowers_url
  end

  private

  def find_borrower
    @borrower = Borrower.find(params[:id])
  end

  def borrower_params
    params.require(:borrower).permit :name, :summ, :norm_rate, :over_rate, :term
  end

end
