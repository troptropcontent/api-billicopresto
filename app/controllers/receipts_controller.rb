class ReceiptsController < ApplicationController
  before_action :authenticate_user!
  load_and_authorize_resource

  def index
    @receipts 
    @receipts_ordered = @receipts.group_by { |t| t.created_at.beginning_of_year } 
    @receipts_ordered_month = @receipts.group_by { |t| t.created_at.beginning_of_month } 
  end

  def filter
    retailers_id = @receipts.includes(till: :retailer).pluck('tills.retailer_id').uniq
    @retailers = Retailer.where(id: retailers_id)
  end

  def show
    @receipt
    @retailer = @receipt.till.retailer
    @lines = @receipt.receipt_lines
  end

  private

  def filter_params
    params.slice(:filter_retailer, :filter_date, :filter_type)
  end
end
