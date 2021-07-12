class CreateProducts < ActiveRecord::Migration[6.1]
  def change
    create_table :products do |t|
      t.integer :kind
      t.string :name
      t.integer :unit

      t.timestamps
    end
  end
end
