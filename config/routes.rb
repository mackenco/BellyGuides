BellyGuide::Application.routes.draw do

  resources :users, only: [:new, :create, :show]
  resource :session, only: [:create, :destroy, :new]
  resources :maps
  resources :restaurants, only: [:create, :update, :destroy]

  root :to => "users#show"
end
