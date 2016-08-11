Rails.application.routes.draw do
  resources :orders do
    resources :orderings
  end

  resources :users
  resources :products

  root "products#index"
  get 'featured/products/' => 'products#featured'
  get 'show' => 'users#show'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
