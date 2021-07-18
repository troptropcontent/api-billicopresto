class CreateTills < ActiveRecord::Migration[6.1]
  def change
    create_table :tills do |t|
      t.string :reference
      t.references :retailer, null: false, foreign_key: true
      t.references :receipt, null: false, foreign_key: true
      t.timestamps
    end
  end
end
