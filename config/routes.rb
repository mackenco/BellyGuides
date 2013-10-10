BellyGuide::Application.routes.draw do

  resources :users, only: [:new, :create, :show]
  resource :session, only: [:create, :destroy, :new]
  resources :maps do
    resources :favorites, only: [:create, :destroy]
  end
  resources :restaurants, only: [:create, :update, :destroy]
  resources :favorites, only: :index
  resources :comments, only: [:create, :destroy]


  root :to => "users#show"
end
