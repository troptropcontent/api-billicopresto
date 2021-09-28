class VouchersController < ApplicationController
  before_action :authenticate_retailer!
  load_and_authorize_resource

  FIELD_FILTER_WHITELIST = [
    
  ]

  def index
    @vouchers =  Controllers::FilterService.new(@vouchers,FIELD_FILTER_WHITELIST, filter_params).filter! if filter_params
  end

  def show
    @voucher
  end

  def new
    @voucher = Voucher.new    
  end

  def create
   @voucher = Voucher.new(voucher_params)
    if @voucher.save
      redirect_to voucher_path(@voucher)
    else
      render :new
    end
  end

  private

  def voucher_params
    params.require(:voucher).permit()
  end
  
  def filter_params
    params[:filters]&.compact_blank
  end
end
