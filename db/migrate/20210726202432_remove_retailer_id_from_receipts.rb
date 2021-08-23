class RemoveRetailerIdFromReceipts < ActiveRecord::Migration[6.1]
  def change
    remove_reference :receipts, :retailer, null: false, foreign_key: true
  end
end
