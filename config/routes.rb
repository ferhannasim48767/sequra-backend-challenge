Rails.application.routes.draw do
  mount Rswag::Ui::Engine => '/api-docs'
  mount Rswag::Api::Engine => '/api-docs'
  root to: 'orders#index'
  resources :orders do
    member do 
      get :calculate_fee
      get :mark_complete
    end
  end
  resources :merchants do
    collection do
      get :get_orders
    end
  end
  resources :shoppers
end
