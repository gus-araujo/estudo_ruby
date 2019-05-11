Rails.application.routes.draw do
  root 'home#index'
  devise_for :users
  resources :users
  resources :posts
  get '/search', to: 'posts#search', as: 'posts_search'
  get '/myposts', to: 'posts#myposts', as: 'myposts'
  get '/authors', to: 'posts#authors', as: 'authors'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  match '*path', to: redirect('/'), via: :all
end
