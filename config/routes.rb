Rails.application.routes.draw do

  root to: 'home#index'

  resources :clients do
    get '/search', to: 'client_search#new', as: :search, on: :collection
    post '/search', to: 'client_search#create', on: :collection
  end

  resources :organizations
  devise_for :users
  resources :client do
    resources :client_beds, as: :beds
  end
end
