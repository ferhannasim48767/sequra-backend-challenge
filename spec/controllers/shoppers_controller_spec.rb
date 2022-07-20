require 'rails_helper'

RSpec.describe ShoppersController, type: :controller do

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
      before { post :create, params: { shopper: { name: 'tester shopper', email: 'shopper@gmail.com', nif: 'abc123' }}}

      it { expect(response).to redirect_to shoppers_path }
      it { expect(Shopper.last.name).to eq('tester shopper') }
    end
  end
end