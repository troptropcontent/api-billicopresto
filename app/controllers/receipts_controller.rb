class ReceiptsController < ApplicationController
  before_action :authenticate_user!
  def index
    conected_user
    @receipts = current_user.receipts
  end

  def show
    conected_user
    @receipt = current_receipt
    @retailer = current_receipt.till.retailer
    @lines = current_receipt.receipt_lines
  end

  private

  def current_receipt
    Receipt.find(params[:id].to_i)
  end

  def conected_user
    @user ||= current_user
  end
end
