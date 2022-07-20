class Merchant < ApplicationRecord
	validates :email, uniqueness: true
	has_many :orders
end
