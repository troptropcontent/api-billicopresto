class ChangeCentsWithDefault < ActiveRecord::Migration[6.1]
  def change
    change_column_default :receipts, :amount_excluding_taxes_cent, 0
    change_column_default :receipts, :amount_including_taxes_cent, 0
    change_column_default :receipts, :amount_taxes_cent, 0
    change_column_default :receipt_lines, :unit_price_cent, 0
    change_column_default :receipt_lines, :amount_taxe_cent, 0
    change_column_default :receipt_lines, :amount_excluding_taxes_cent, 0
    change_column_default :receipt_lines, :amount_including_taxes_cent, 0
  end
end
