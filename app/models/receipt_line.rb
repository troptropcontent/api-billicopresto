class ReceiptLine < ApplicationRecord
  belongs_to :item
  belongs_to :receipt

  after_commit :update_receipt_total,
               # if: lambda {
               #       saved_change_to_amount_including_taxes_cent
               #     }

  enum budget_category: [:leisure, :communication, :food_and_beverage, :transport, :health, :house_cleaning]

  def update_receipt_total
    byebug
  end
end
