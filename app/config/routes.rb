Rails.application.routes.draw do
  root 'welcome#index'
 # get 'welcome#generic'
 # get 'welcome#elements'
 # get 'welcome/generic' => 'welcome#generic'#, as: generic

  resources :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
