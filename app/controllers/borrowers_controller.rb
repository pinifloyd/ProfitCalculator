class BorrowersController < ApplicationController

  before_action :find_borrower, only: %i(show edit update destroy)

  def index
    @borrowers = Borrower.order(id: :desc)
    @borrowers = BorrowerDecorator.decorate_collection(@borrowers)
  end

  def show
    @borrower = BorrowerDecorator.decorate(@borrower)
    @periods = Borrower::PeriodDecorator.decorate_collection(@borrower.periods)
  end

  def new
    @borrower = Borrower.new
  end

  def create
    @borrower = Borrower.new create_borrower_params

    if @borrower.save
      redirect_to borrower_url @borrower
    else
      render action: :new
    end
  end

  def edit; end

  def update
    if @borrower.update_attributes edit_borrower_params
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

  def create_borrower_params
    params.require(:borrower).permit :name, :summ
  end

  def edit_borrower_params
    params.require(:borrower).permit :name
  end

end
