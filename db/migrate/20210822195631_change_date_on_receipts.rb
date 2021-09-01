class ChangeDateOnReceipts < ActiveRecord::Migration[6.1]
  def change
    change_column :receipts, :date, :date
  end
end
