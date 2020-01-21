Rails.application.routes.draw do
  resources :properties
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html


  root to: "static_pages#index"
end
