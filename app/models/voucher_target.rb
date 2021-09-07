class VoucherTarget < ApplicationRecord
  belongs_to :user
  belongs_to :target

  validates :user_id, uniqueness: { scope: :voucher_id }
end
