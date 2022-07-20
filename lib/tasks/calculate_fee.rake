task calculate_fee: :environment do
  Order.completed.each do |order|
    CalculateFeeService.call(order)
  end
end