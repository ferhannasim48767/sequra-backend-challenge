class Order < ApplicationRecord
	LESS_THAN_50 = 1
	BETWEEN_50_AND_300 = 0.95
	GREATER_THAN_300 = 0.85

	scope :completed, -> { where.not(completed_at: nil) }
	validates :amount, numericality: true

	belongs_to :merchant
	belongs_to :shopper
end
