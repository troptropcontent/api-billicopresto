class Retailer < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :tills

  enum brand: [:carrefour_market, :monoprix, :auchan]
  

  def receipts
    Receipts.includes(:till).where(tills:{building_id: building_id})
  end
end
