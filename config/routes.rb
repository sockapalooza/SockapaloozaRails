Rails.application.routes.draw do
  get 'orderings/create'

  get 'orderings/update'

  get 'orderings/destroy'

  resources :orders
  resources :users
  resources :products
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
