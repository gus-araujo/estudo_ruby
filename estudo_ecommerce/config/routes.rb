Rails.application.routes.draw do
  resources :products
  get 'contato', to: 'home#contact'
  get 'sobre', to: 'home#about'
  devise_for :users
  root 'home#Index'
  
  resources :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
