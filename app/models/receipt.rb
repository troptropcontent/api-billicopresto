class Receipt < ApplicationRecord
  has_many :receipt_lines
  belongs_to :retailer
  belongs_to :user
end
