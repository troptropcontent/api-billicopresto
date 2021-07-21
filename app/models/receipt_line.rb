class ReceiptLine < ApplicationRecord
  belongs_to :item
  belongs_to :receipt

  enum budget_category: [:leisure, :communication, :food_and_beverage, :transport, :health, :house_cleaning]
end
