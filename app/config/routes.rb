Rails.application.routes.draw do
  devise_for :users
  root 'welcome#index'
  get 'generic' => 'welcome#generic' , as: 'generic'
  get 'elements' => 'welcome#elements', as: 'elements'
 # get 'welcome/generic' => 'welcome#generic'#, as: generic

  resources :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
