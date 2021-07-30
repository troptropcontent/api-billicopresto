class Receipt < ApplicationRecord
  has_many :receipt_lines
  belongs_to :till
  belongs_to :user

  after_commit :update_amounts, 
                if: Proc.new { saved_change_to_amount_excluding_taxes_cent? || saved_change_to_amount_taxe_cent? }

  def update_amounts
    t.integer "amount_including_taxes_cent"
    t.integer "taxe_rate"
    t.integer "amount_taxes_cent"
    update!(
      amount_including_taxes_cent: amount_excluding_taxes_cent + amount_taxe_cent, 
        )
  end
end
