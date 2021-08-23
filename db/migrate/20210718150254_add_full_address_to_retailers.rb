class AddFullAddressToRetailers < ActiveRecord::Migration[6.1]
  def change
    add_column :retailers, :full_address, :string
  end
end
