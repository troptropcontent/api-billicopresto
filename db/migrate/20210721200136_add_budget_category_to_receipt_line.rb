class AddBudgetCategoryToReceiptLine < ActiveRecord::Migration[6.1]
  def change
    add_column :receipt_lines, :budget_category, :integer
  end
end
