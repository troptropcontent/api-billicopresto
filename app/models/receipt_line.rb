class ReceiptLine < ApplicationRecord
  belongs_to :item
  belongs_to :receipt

  after_commit :update_receipt_amount

  after_commit :update_amounts, 
                if: Proc.new { saved_change_to_quantity? || saved_change_to_quantity? ||  saved_change_to_taxe_rate? }

  enum budget_category: [:leisure, :communication, :food_and_beverage, :transport, :health, :house_cleaning]

  def update_receipt_amount_excluding_taxes_cent
    sum_amount_excluding_taxes_cent = receipt.receipt_lines.sum(&:amount_excluding_taxes_cent)
    sum_amount_excluding_amount_taxes_cent = receipt.receipt_lines.sum(&:amount_taxe_cent)
    receipt.update!(amount_excluding_taxes_cent: new_amount, amount_taxe_cent: sum_amount_excluding_amount_taxes_cent)
  end

  def update_amounts
    byebug
    amount_excluding_taxes_cent = quantity*unit_price_cent
    amount_taxe_cent = amount_excluding_taxes_cent*taxe_rate/100
    amount_including_taxes_cent = amount_excluding_taxes_cent + amount_taxe_cent
    update!(
      amount_excluding_taxes_cent: amount_excluding_taxes_cent, 
      amount_taxe_cent: amount_taxe_cent, 
      amount_including_taxes_cent: amount_including_taxes_cent )
  end
end
