class AddBrandToRetailers < ActiveRecord::Migration[6.1]
  def change
    add_column :retailers, :brand, :integer
  end
end
