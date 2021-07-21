class Till < ApplicationRecord
  belongs_to :retailer
  has_many :receipts
end
