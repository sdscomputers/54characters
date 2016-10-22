Rails.application.routes.draw do
  resources :organizations
  devise_for :users
  resources :client do
    resources :client_beds, as: :beds
  end
end
