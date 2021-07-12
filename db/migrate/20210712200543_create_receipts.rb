class CreateReceipts < ActiveRecord::Migration[6.1]
  def change
    create_table :receipts do |t|
      t.integer :amount_excluding_taxes_cent
      t.integer :amount_including_taxes_cent
      t.integer :taxe_rate
      t.integer :amount_taxes_cent
      t.references :retailer, null: false, foreign_key: true
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
