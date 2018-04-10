Rails.application.routes.draw do
  root 'welcome#index'
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'

  get '/dashboard', to: 'user#show'

  resources :stations
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
