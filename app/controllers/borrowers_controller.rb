class BorrowersController < ApplicationController

  def index
    @borrowers = Borrower.order(id: :desc)
    @borrowers = BorrowerDecorator.decorate_collection(@borrowers)
  end

  def show
    @borrower = Borrower.find(params[:id])
    @borrower = BorrowerDecorator.decorate(@borrower)
  end

end
