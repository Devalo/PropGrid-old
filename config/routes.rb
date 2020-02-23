Rails.application.routes.draw do
  resources :tenants
  resources :foobars

  #nesting property units under
  resources :properties do
    resources :property_units
  end
  devise_for :users

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html


  root to: "properties#index"
end
