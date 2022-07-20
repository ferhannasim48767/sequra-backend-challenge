class CalculateFeeService

  def self.call(order)
    amount =  order.amount
   if order.amount < 50
      order.update(disburs_fee: fee(amount, Order::LESS_THAN_50))
    elsif amount >= 50 && amount <= 300
      order.update(disburs_fee: fee(amount, Order::BETWEEN_50_AND_300))
    elsif amount > 300
      order.update(disburs_fee: fee(amount, Order::GREATER_THAN_300))
    end
  end

  def self.fee(amount, percent)
    amount - (amount * percent.to_f / 100.to_f)
  end
end
