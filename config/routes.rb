Rails.application.routes.draw do

  resources :referrals do
    get '/complete', to: 'confirm_referrals#edit', on: :member
    patch '/complete', to: 'confirm_referrals#update', on: :member
  end

  resources :clients do
    get '/search', to: 'client_search#new', as: :search, on: :collection
    post '/search', to: 'client_search#create', on: :collection
  end

  resources :housing
  resources :organizations

  devise_for :users

  resources :client do
    resources :client_beds, as: :beds
  end
end