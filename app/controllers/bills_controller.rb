# frozen_string_literal: true

class BillsController < ApplicationController
  before_action :set_bill, :set_currency, only: %i[receipt download]

  def new
    @bill = Bill.new
    5.times { @bill.items.build }
  end

  def create
    @bill = Bill.create(bill_params)

    if @bill.persisted?
      redirect_to receipt_bill_path(@bill)
    end
  end

  def receipt; end

  def download
    respond_to do |format|
      format.html
      format.pdf do
        render pdf: 'download'
      end
    end
  end

  private

  def bill_params
    params.require(:bill).permit(
      items_attributes: %i[quantity price description]
    )
  end

  def set_bill
    @bill = Bill.find(params[:id])
  end

  def set_currency
    @to = params[:to_currency] || 'EUR'
  end
end
