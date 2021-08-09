class ReceiptsController < ApplicationController
  before_action :authenticate_user!
  load_and_authorize_resource

  def index
    @receipts 
  end

  def show
    @receipt
    @retailer = @receipt.till.retailer
    @lines = @receipt.receipt_lines
  end
end
