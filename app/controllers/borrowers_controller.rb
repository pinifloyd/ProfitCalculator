class BorrowersController < ApplicationController

  def index
    @borrowers = Borrower.order(id: :desc)
    @borrowers = BorrowerDecorator.decorate_collection(@borrowers)
  end

  def show
    @borrower = Borrower.find(params[:id])
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

  def edit
  end

  def update
  end

  def destroy
  end

  private

  def borrower_params
    params.require(:borrower).permit :name, :summ, :norm_rate, :over_rate, :term
  end

end
