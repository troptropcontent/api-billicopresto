class AddAddressAndBirthDayToUser < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :birthday, :date
    add_column :users, :full_address, :string
    add_column :users, :zip_code, :string
    add_column :users, :city, :string
  end
end
