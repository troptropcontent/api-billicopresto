class AddStatusToReceipts < ActiveRecord::Migration[6.1]
  def change
    add_column :receipts, :status, :integer, default: 0
  end
end
