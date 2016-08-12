Rails.application.routes.draw do
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  resources :orders do
    resources :orderings
  end

  resources :users
  resources :products
  resources :charges

  root "products#index"
  get 'featured/products/' => 'products#featured'
  get 'show' => 'users#show'
  get 'checkout' => 'orders#checkout'
  post 'login' => 'users#login'
  post 'logout' => 'users#logout'


  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
