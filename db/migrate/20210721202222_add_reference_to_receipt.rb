class AddReferenceToReceipt < ActiveRecord::Migration[6.1]
  def change
    add_column :receipts, :reference, :string
  end
end
