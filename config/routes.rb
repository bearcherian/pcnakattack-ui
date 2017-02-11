Rails.application.routes.draw do
  root 'application#index'
  get '/allItems', to: 'all_items#show'
  resources :youtubes
  resources :users
  resources :tweets
  resources :instagrams
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
