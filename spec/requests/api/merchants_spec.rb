require 'swagger_helper'

RSpec.describe 'api/merchants', type: :request do
  path '/merchants/get_orders.json' do

    get 'Retrieves orders' do
      tags 'Orders'
      operationId 'merchant#get_orders'
      consumes 'application/json'
      produces 'application/json'
      parameter(name: :id, in: :query, type: :string)
      parameter(name: :week, in: :query, type: :string)

      response '200', 'orders successfully shown.' do
        context 'when orders will be displayed' do

          run_test! do
            expect(response).to render_template('merchants/get_orders')
          end
        end
      end
    end
  end
end
