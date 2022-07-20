require 'rails_helper'

describe CalculateFeeService do

  describe '#call' do
    let!(:shopper) { create :shopper }
    let!(:merchant) { create :merchant}

    context 'when amount is smaller than 50' do
      let!(:order) { create :order, amount: 45, shopper_id: shopper.id, merchant_id: merchant.id }

      let!(:call_service) { described_class.call(order) }

      it 'returns disbursment fee' do
        expect(order.disburs_fee).to eq(44.55)
      end
    end

    context 'when amount is between 50 and 300' do
      let!(:order) { create :order, amount: 250, shopper_id: shopper.id, merchant_id: merchant.id }

      let!(:call_service) { described_class.call(order) }

      it 'returns disbursment fee' do
        expect(order.disburs_fee).to eq(247.625)
      end
    end

    context 'when amount is greater than 300' do
      let!(:order) { create :order, amount: 400, shopper_id: shopper.id, merchant_id: merchant.id }

      let!(:call_service) { described_class.call(order) }

      it 'returns disbursment fee' do
        expect(order.disburs_fee).to eq(396.6)
      end
    end
  end
end
