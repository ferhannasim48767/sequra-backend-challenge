class Shopper < ApplicationRecord
	validates :email, uniqueness: true
	has_many :orders
end
