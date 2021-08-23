class ReceiptsController < ApplicationController
  before_action :authenticate_user!
  load_and_authorize_resource

  def index
    @receipts 
    @receipts_ordered = @receipts.group_by { |t| t.created_at.beginning_of_year } 
    @receipts_ordered_month = @receipts.group_by { |t| t.created_at.beginning_of_month } 
  end

  def show
    @receipt
    @retailer = @receipt.till.retailer
    @lines = @receipt.receipt_lines
  end
end
