class Receipt < ApplicationRecord
  has_many :receipt_lines
  belongs_to :till
  belongs_to :user
end
