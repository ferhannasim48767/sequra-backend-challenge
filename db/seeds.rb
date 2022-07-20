merchants = {}
shoppers = {}

merchants = [
	{ 
		name: 'Treutel, Schumm and Fadel',
		email: 'info@treutel-schumm-and-fadel.com',
		cif: 'B611111111'
	},
	{ 
		name: 'Windler and Sons',
		email: 'info@windler-and-sons.com',
		cif: 'B611111112'
	},
	{ 
		name: 'Mraz and Sons',
		email: 'info@mraz-and-sons.com',
		cif: 'B611111113'
	},
	{ 
		name: 'Cummerata LLC',
		email: 'info@cummerata-llc.com',
		cif: 'B611111114'
	}
]
shoppers = [
	{
		name: 'Olive Thompson',
		email: 'olive.thompson@not_gmail.com',
		nif: '411111111Z'
	},
	{
		name: 'Virgen Anderson',
		email: 'virgen.anderson@not_gmail.com',
		nif: '411111112Z'
	},
	{
		name: 'Reagan Auer',
		email: 'reagan.auer@not_gmail.com',
		nif: '411111113Z'
	},
	{
		name: 'Shanelle Satterfield',
		email: 'shanelle.satterfield@not_gmail.com',
		nif: '411111114Z'
	}
]

merchants.each do |merchant|
	Merchant.create(name: merchant[:name], email: merchant[:email], cif: merchant[:cif])
end

shoppers.each do |shopper|
	Shopper.create(name: shopper[:name], email: shopper[:email], nif: shopper[:nif])
end

Order.create(amount: 61.74, shopper_id: Shopper.first.id, merchant_id: Merchant.first.id, completed_at: DateTime.now)
Order.create(amount: 293.08, shopper_id: Shopper.second.id, merchant_id: Merchant.second.id, completed_at: DateTime.now)
Order.create(amount: 373.33, shopper_id: Shopper.third.id, merchant_id: Merchant.third.id)
Order.create(amount: 60.48, shopper_id: Shopper.fourth.id, merchant_id: Merchant.fourth.id)