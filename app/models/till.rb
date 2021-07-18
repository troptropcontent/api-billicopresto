class Till < ApplicationRecord
  belongs_to :retailer
  belongs_to :receipt
end
