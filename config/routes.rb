Rails.application.routes.draw do
  resources :documents
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  resources :tenants
  resources :foobars

  #nesting property units under
  resources :properties do
    resources :property_units do
      resources :leases, only: [:new, :show, :create, :destroy]
      resources :documents, only: [:index, :new, :show, :create, :destroy]
    end
  end
  devise_for :users, path: "user", controllers: { sessions: "users/sessions", registrations: "users/registrations"}

  devise_for :tenants, path: "tenant_space", controllers: { sessions: "tenants/sessions", confirmations: "tenants/confirmations"}
  get 'tenant_space/index', as: 'tenant_space'

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root to: "properties#index"


  # Todo API namespace, makes routes render at /api/v1/todo_items
  # defaults { format: :json } ensures that the data returned from the routes is JSON.
  namespace :api, defaults: { format: :json } do
    namespace :v1 do
      resources :todo_items, only: [:index, :show, :create, :update, :destroy]
    end
  end
end
