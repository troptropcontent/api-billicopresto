class AddCityToRetailer < ActiveRecord::Migration[6.1]
  def change
    add_column :retailers, :city, :string
  end
end
