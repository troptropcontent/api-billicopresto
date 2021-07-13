class AddNameToRetailer < ActiveRecord::Migration[6.1]
  def change
    add_column :retailers, :name, :string
    add_column :retailers, :street, :string
    add_column :retailers, :number, :string
    add_column :retailers, :complement, :string
    add_column :retailers, :country, :string
    add_column :retailers, :region, :string
    add_column :users, :firest_name, :string
    add_column :users, :last_name, :string
  end
end
