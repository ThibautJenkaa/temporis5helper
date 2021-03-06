Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root 'welcome#index'
  get 'signup', to: "users#new"
  get 'users', to: "users#new"
  resources :users, only: [:create]
  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'
  get 'create_items_dofusapi', to: 'items#create_items_dofus_api'
  resources :items, only: [:index]
end
