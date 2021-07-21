class AddTillIdToReceipt < ActiveRecord::Migration[6.1]
  def change
    add_reference :receipts, :till, index: true
    remove_reference :tills, :receipt, index: true
  end
end
