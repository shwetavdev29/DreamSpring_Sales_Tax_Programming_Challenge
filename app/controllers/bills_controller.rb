class BillsController < ApplicationController
  def new
    @bill = Bill.new
    5.times { @bill.items.build }
  end

  def create
    @bill = Bill.create(bill_params)

    if @bill.persisted?
      redirect_to receipt_bill_path(@bill)
    else
      render 'new'
    end
  end

  def receipt; end

  private

  def bill_params
    params.require(:bill).permit(
      items_attributes: %i[quantity price description]
    )
  end
end
