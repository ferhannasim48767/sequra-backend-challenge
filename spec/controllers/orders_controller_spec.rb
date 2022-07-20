require 'rails_helper'

RSpec.describe OrdersController, type: :controller do
  let!(:merchant) { create :merchant }
  let!(:shopper) { create :shopper }
  let!(:order) { create :order, shopper_id: shopper.id, merchant_id: merchant.id }

  describe '#index' do
    context 'renders index page successfully' do
      before { get :index }

      it { expect(response).to have_http_status(:ok) }
      it { expect(response).to render_template('index') }
    end
  end

  describe '#new' do
    context 'renders new page successfully' do
      before { get :new }

      it { expect(response).to have_http_status(:ok) }
      it { expect(response).to render_template('new') }
    end
  end

  describe '#create' do
    context 'created successfully' do
      before { post :create, params: { order: { amount: 100, shopper_id: shopper.id, merchant_id: merchant.id }}}

      it { expect(response).to redirect_to orders_path }
    end
  end

  describe '#create' do
    context 'not created successfully' do
      before { post :create, params: { order: { amount: 100 }}}

      it { expect(response).to render_template('new') }
    end
  end

  describe '#destroy' do
    let!(:merchant) { create :merchant }
    let!(:shopper) { create :shopper }
    let!(:order) { create :order, shopper_id: shopper.id, merchant_id: merchant.id }

    context 'destroys tour successfully' do
      before { delete :destroy, params: { id: order.id } }

      it do
        expect(response).to redirect_to orders_path
      end
    end
  end

  describe '#mark_complete' do
    let!(:order) { create :order, shopper_id: shopper.id, merchant_id: merchant.id, completed_at: nil }
    context 'mark complete order successfully' do
      before { get :mark_complete, params: { id: order.id } }

      it do
        expect(response).to redirect_to orders_path
      end
    end
  end

  describe '#calculate_fee' do
    let!(:order) { create :order, amount: 100.to_f, shopper_id: shopper.id, merchant_id: merchant.id }
    context 'calculated fee of order successfully' do
      before { get :calculate_fee, params: { id: order.id } }

      it do
        expect(response).to redirect_to orders_path
        expect(Order.last.disburs_fee).to eq(99.05)
      end
    end
  end
end