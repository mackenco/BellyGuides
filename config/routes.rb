BellyGuide::Application.routes.draw do

  resources :users, only: [:new, :create, :show]
  resource :session, only: [:create, :destroy, :new]
  resources :maps, only: [:create, :new, :show, :update, :edit, :destroy]

  root :to => "users#show"
end
