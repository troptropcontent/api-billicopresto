class ChangeFirestNameIntoFirstName < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :first_name, :string
    remove_column :users, :firest_name
  end
end
