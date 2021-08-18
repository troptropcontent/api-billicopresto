class ReceiptsController < ApplicationController
  before_action :authenticate_user!
  load_and_authorize_resource

  def index
    filter_receipts
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
    params.select{|k,v| k.start_with?('filter_') && v.present?}
  end

  def filter_receipts
    if %w[filter_date_type filter_date_value].all?{|filter| filter_params.key?(filter)}
      case filter_params["filter_date_type"]
        when "before"
          @receipts = @receipts.where("created_at <= ?", filter_params["filter_date_value"])
          @filters = [{"before" => filter_params["filter_date_value"]}]
        when "on_date"
          @receipts = @receipts.where("created_at = ?", filter_params["filter_date_value"])
          @filters = [{"on_date" => filter_params["filter_date_value"]}]
        when "after"
          @receipts = @receipts.where("created_at >= ?", filter_params["filter_date_value"])
          @filters = [{"after" => filter_params["filter_date_value"]}]
      end
    end
  end

end
