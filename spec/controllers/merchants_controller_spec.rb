require 'rails_helper'

RSpec.describe MerchantsController, type: :controller do

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
      before { post :create, params: { merchant: { name: 'tester merchant', email: 'merchant@gmail.com', cif: 'abc123' }}}

      it { expect(response).to redirect_to merchants_path }
      it { expect(Merchant.last.name).to eq('tester merchant') }
    end
  end

  describe '#get_orders' do
    let!(:merchant) { create :merchant }
    context 'get orders if when week is passed in params' do
      before { get :get_orders, params: { week: 29, id: merchant.id }, as: :json }

      it { expect(response).to render_template('merchants/get_orders') }
    end
  end

  describe '#get_orders' do
    let!(:merchant) { create :merchant }
    context 'get orders if when week is passed in params' do
      before { get :get_orders, params: { week: 29 }, as: :json }

      it { expect(response).to render_template('merchants/get_orders') }
    end
  end
end