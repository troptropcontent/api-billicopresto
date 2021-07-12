class Receipt < ApplicationRecord
  belongs_to :retailer
  belongs_to :user
end
