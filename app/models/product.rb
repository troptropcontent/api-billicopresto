class Product < ApplicationRecord
	has_many :items
	enum kind: ["Health and beauty", "Electronic accessories", "Home and lifestyle", "Sports and travel", "Food and beverages", "Fashion accessories"]
end
