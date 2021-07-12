class CreateReceiptLines < ActiveRecord::Migration[6.1]
  def change
    create_table :receipt_lines do |t|
      t.integer :quantity
      t.integer :unit_price_cent
      t.integer :taxe_rate
      t.integer :amount_taxe_cent
      t.integer :amount_excluding_taxes_cent
      t.integer :amount_including_taxes_cent
      t.references :item, null: false, foreign_key: true
      t.references :receipt, null: false, foreign_key: true

      t.timestamps
    end
  end
end
